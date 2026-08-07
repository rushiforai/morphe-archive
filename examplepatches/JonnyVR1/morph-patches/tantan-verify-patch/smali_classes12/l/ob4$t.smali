.class Ll/ob4$t;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ia4$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ob4;->z1(ILl/qow;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/ob4;


# direct methods
.method public constructor <init>(Ll/ob4;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ob4$t;->a:Ll/ob4;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public D([B)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ob4$t;->a:Ll/ob4;

    .line 2
    .line 3
    invoke-static {v0}, Ll/ob4;->a1(Ll/ob4;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_5

    .line 8
    .line 9
    if-eqz p1, :cond_5

    .line 10
    .line 11
    iget-object v0, p0, Ll/ob4$t;->a:Ll/ob4;

    .line 12
    .line 13
    invoke-static {v0}, Ll/ob4;->c1(Ll/ob4;)Ll/v5c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    goto/16 :goto_2

    .line 20
    .line 21
    :cond_0
    iget-object v0, p0, Ll/ob4$t;->a:Ll/ob4;

    .line 22
    .line 23
    invoke-static {v0}, Ll/ob4;->c1(Ll/ob4;)Ll/v5c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Ll/v5c;->a1()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    goto/16 :goto_2

    .line 34
    .line 35
    :cond_1
    iget-object v0, p0, Ll/ob4$t;->a:Ll/ob4;

    .line 36
    .line 37
    invoke-static {v0}, Ll/ob4;->i(Ll/ob4;)I

    .line 38
    .line 39
    .line 40
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 41
    .line 42
    .line 43
    move-result-wide v0

    .line 44
    iget-object v2, p0, Ll/ob4$t;->a:Ll/ob4;

    .line 45
    .line 46
    invoke-static {v2}, Ll/ob4;->j(Ll/ob4;)J

    .line 47
    .line 48
    .line 49
    move-result-wide v2

    .line 50
    sub-long/2addr v0, v2

    .line 51
    const-wide/16 v2, 0x3e8

    .line 52
    .line 53
    cmp-long v0, v0, v2

    .line 54
    .line 55
    if-lez v0, :cond_2

    .line 56
    .line 57
    iget-object v0, p0, Ll/ob4$t;->a:Ll/ob4;

    .line 58
    .line 59
    invoke-static {v0}, Ll/ob4;->g(Ll/ob4;)I

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    iput v1, v0, Ll/ob4;->D:I

    .line 64
    .line 65
    iget-object v0, p0, Ll/ob4$t;->a:Ll/ob4;

    .line 66
    .line 67
    const/4 v1, 0x0

    .line 68
    invoke-static {v0, v1}, Ll/ob4;->h(Ll/ob4;I)I

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Ll/ob4$t;->a:Ll/ob4;

    .line 72
    .line 73
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 74
    .line 75
    .line 76
    move-result-wide v1

    .line 77
    invoke-static {v0, v1, v2}, Ll/ob4;->m(Ll/ob4;J)J

    .line 78
    .line 79
    .line 80
    :cond_2
    iget-object v0, p0, Ll/ob4$t;->a:Ll/ob4;

    .line 81
    .line 82
    invoke-static {v0}, Ll/ob4;->n(Ll/ob4;)Ll/sow;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    iget-boolean v0, v0, Ll/sow;->T:Z

    .line 87
    .line 88
    iget-object v1, p0, Ll/ob4$t;->a:Ll/ob4;

    .line 89
    .line 90
    if-eqz v0, :cond_3

    .line 91
    .line 92
    invoke-virtual {v1, p1}, Ll/ob4;->E1([B)[B

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    iget-object v0, p0, Ll/ob4$t;->a:Ll/ob4;

    .line 97
    .line 98
    iget-object v0, v0, Ll/ob4;->H:Ljava/lang/Object;

    .line 99
    .line 100
    monitor-enter v0

    .line 101
    :try_start_0
    iget-object v1, p0, Ll/ob4$t;->a:Ll/ob4;

    .line 102
    .line 103
    invoke-static {v1, p1}, Ll/ob4;->o(Ll/ob4;[B)Lcom/immomo/components/interfaces/IProcessOutput;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    iget-object p0, p0, Ll/ob4$t;->a:Ll/ob4;

    .line 108
    .line 109
    invoke-static {p0, p1, v1}, Ll/ob4;->p(Ll/ob4;[BLcom/immomo/components/interfaces/IProcessOutput;)V

    .line 110
    .line 111
    .line 112
    monitor-exit v0

    .line 113
    return-void

    .line 114
    :catchall_0
    move-exception p0

    .line 115
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 116
    throw p0

    .line 117
    :cond_3
    invoke-virtual {v1, p1}, Ll/ob4;->E1([B)[B

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    iget-object v0, p0, Ll/ob4$t;->a:Ll/ob4;

    .line 122
    .line 123
    iget-object v0, v0, Ll/ob4;->H:Ljava/lang/Object;

    .line 124
    .line 125
    monitor-enter v0

    .line 126
    :try_start_1
    iget-object v1, p0, Ll/ob4$t;->a:Ll/ob4;

    .line 127
    .line 128
    invoke-static {v1, p1}, Ll/ob4;->o(Ll/ob4;[B)Lcom/immomo/components/interfaces/IProcessOutput;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    iget-object v2, p0, Ll/ob4$t;->a:Ll/ob4;

    .line 133
    .line 134
    invoke-static {v2}, Ll/ob4;->q(Ll/ob4;)Z

    .line 135
    .line 136
    .line 137
    move-result v2

    .line 138
    if-eqz v2, :cond_4

    .line 139
    .line 140
    iget-object v2, p0, Ll/ob4$t;->a:Ll/ob4;

    .line 141
    .line 142
    invoke-static {v2, v1}, Ll/ob4;->r(Ll/ob4;Lcom/immomo/components/interfaces/IProcessOutput;)V

    .line 143
    .line 144
    .line 145
    goto :goto_0

    .line 146
    :catchall_1
    move-exception p0

    .line 147
    goto :goto_1

    .line 148
    :cond_4
    :goto_0
    iget-object p0, p0, Ll/ob4$t;->a:Ll/ob4;

    .line 149
    .line 150
    invoke-static {p0, p1, v1}, Ll/ob4;->p(Ll/ob4;[BLcom/immomo/components/interfaces/IProcessOutput;)V

    .line 151
    .line 152
    .line 153
    monitor-exit v0

    .line 154
    return-void

    .line 155
    :goto_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 156
    throw p0

    .line 157
    :cond_5
    :goto_2
    return-void
.end method

.method public E([B)V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/ob4$t;->a:Ll/ob4;

    .line 2
    .line 3
    iget-object v0, v0, Ll/ob4;->f0:Ll/c3i0;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/c3i0;->g([B)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/ob4$t;->a:Ll/ob4;

    .line 9
    .line 10
    invoke-static {p0}, Ll/ob4;->f(Ll/ob4;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :catch_0
    move-exception p0

    .line 15
    const-string p1, "media"

    .line 16
    .line 17
    invoke-static {p1, p0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
