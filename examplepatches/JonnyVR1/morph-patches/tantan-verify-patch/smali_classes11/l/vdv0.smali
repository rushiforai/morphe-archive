.class public final Ll/vdv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcv0;


# instance fields
.field public final a:Ll/zxt0;

.field public final b:Landroid/content/Context;

.field public final c:Ll/ltu0;

.field public final d:Ll/o7w0;

.field public final e:Ljava/util/concurrent/Executor;

.field public final f:Ll/eow0;


# direct methods
.method public constructor <init>(Ll/zxt0;Landroid/content/Context;Ljava/util/concurrent/Executor;Ll/ltu0;Ll/o7w0;Ll/eow0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/vdv0;->b:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p1, p0, Ll/vdv0;->a:Ll/zxt0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/vdv0;->e:Ljava/util/concurrent/Executor;

    .line 9
    .line 10
    iput-object p4, p0, Ll/vdv0;->c:Ll/ltu0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/vdv0;->d:Ll/o7w0;

    .line 13
    .line 14
    iput-object p6, p0, Ll/vdv0;->f:Ll/eow0;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final a(Ll/b7w0;Ll/q6w0;)Z
    .locals 0

    .line 1
    iget-object p0, p2, Ll/q6w0;->t:Ll/u6w0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/u6w0;->a:Ljava/lang/String;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public final b(Ll/b7w0;Ll/q6w0;)Ll/hpr;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Ll/pvw0;->h(Ljava/lang/Object;)Ll/hpr;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    new-instance v1, Ll/udv0;

    .line 7
    .line 8
    invoke-direct {v1, p0, p1, p2}, Ll/udv0;-><init>(Ll/vdv0;Ll/b7w0;Ll/q6w0;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/vdv0;->e:Ljava/util/concurrent/Executor;

    .line 12
    .line 13
    invoke-static {v0, v1, p0}, Ll/pvw0;->n(Ll/hpr;Ll/xuw0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final synthetic c(Ll/b7w0;Ll/q6w0;Ljava/lang/Object;)Ll/hpr;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object p3, p0, Ll/vdv0;->b:Landroid/content/Context;

    .line 2
    .line 3
    iget-object v0, p2, Ll/q6w0;->v:Ljava/util/List;

    .line 4
    .line 5
    invoke-static {p3, v0}, Ll/u7w0;->a(Landroid/content/Context;Ljava/util/List;)Lcom/google/android/gms/ads/internal/client/zzq;

    .line 6
    .line 7
    .line 8
    move-result-object p3

    .line 9
    iget-object v0, p1, Ll/b7w0;->b:Ll/a7w0;

    .line 10
    .line 11
    iget-object v0, v0, Ll/a7w0;->b:Ll/t6w0;

    .line 12
    .line 13
    iget-object v1, p0, Ll/vdv0;->c:Ll/ltu0;

    .line 14
    .line 15
    invoke-virtual {v1, p3, p2, v0}, Ll/ltu0;->a(Lcom/google/android/gms/ads/internal/client/zzq;Ll/q6w0;Ll/t6w0;)Ll/wit0;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-boolean v1, p2, Ll/q6w0;->X:Z

    .line 20
    .line 21
    invoke-interface {v0, v1}, Ll/wit0;->b0(Z)V

    .line 22
    .line 23
    .line 24
    sget-object v1, Ll/sgs0;->I7:Ll/dgs0;

    .line 25
    .line 26
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-virtual {v2, v1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    check-cast v1, Ljava/lang/Boolean;

    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-eqz v1, :cond_0

    .line 41
    .line 42
    iget-boolean v1, p2, Ll/q6w0;->h0:Z

    .line 43
    .line 44
    if-eqz v1, :cond_0

    .line 45
    .line 46
    iget-object v1, p0, Ll/vdv0;->b:Landroid/content/Context;

    .line 47
    .line 48
    move-object v2, v0

    .line 49
    check-cast v2, Landroid/view/View;

    .line 50
    .line 51
    invoke-static {v1, v2, p2}, Lcom/google/android/gms/internal/ads/zzcvt;->a(Landroid/content/Context;Landroid/view/View;Ll/q6w0;)Lcom/google/android/gms/internal/ads/zzcvt;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    goto :goto_0

    .line 56
    :cond_0
    iget-object v1, p0, Ll/vdv0;->b:Landroid/content/Context;

    .line 57
    .line 58
    iget-object v2, p0, Ll/vdv0;->f:Ll/eow0;

    .line 59
    .line 60
    new-instance v3, Lcom/google/android/gms/internal/ads/zzdtn;

    .line 61
    .line 62
    invoke-interface {v2, p2}, Ll/eow0;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    check-cast v2, Ll/c1s0;

    .line 67
    .line 68
    move-object v4, v0

    .line 69
    check-cast v4, Landroid/view/View;

    .line 70
    .line 71
    invoke-direct {v3, v1, v4, v2}, Lcom/google/android/gms/internal/ads/zzdtn;-><init>(Landroid/content/Context;Landroid/view/View;Ll/c1s0;)V

    .line 72
    .line 73
    .line 74
    move-object v1, v3

    .line 75
    :goto_0
    iget-object v2, p0, Ll/vdv0;->a:Ll/zxt0;

    .line 76
    .line 77
    new-instance v3, Ll/a0u0;

    .line 78
    .line 79
    const/4 v4, 0x0

    .line 80
    invoke-direct {v3, p1, p2, v4}, Ll/a0u0;-><init>(Ll/b7w0;Ll/q6w0;Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    new-instance p1, Ll/bxt0;

    .line 84
    .line 85
    new-instance v5, Ll/pdv0;

    .line 86
    .line 87
    invoke-direct {v5, v0}, Ll/pdv0;-><init>(Ll/wit0;)V

    .line 88
    .line 89
    .line 90
    invoke-static {p3}, Ll/u7w0;->b(Lcom/google/android/gms/ads/internal/client/zzq;)Ll/r6w0;

    .line 91
    .line 92
    .line 93
    move-result-object p3

    .line 94
    invoke-direct {p1, v1, v0, v5, p3}, Ll/bxt0;-><init>(Landroid/view/View;Ll/wit0;Ll/izt0;Ll/r6w0;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v2, v3, p1}, Ll/zxt0;->a(Ll/a0u0;Ll/bxt0;)Ll/vwt0;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    invoke-virtual {p1}, Ll/vwt0;->j()Ll/ktu0;

    .line 102
    .line 103
    .line 104
    move-result-object p3

    .line 105
    const/4 v1, 0x0

    .line 106
    invoke-virtual {p3, v0, v1, v4}, Ll/ktu0;->i(Ll/wit0;ZLl/dqs0;)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {p1}, Ll/lzt0;->b()Ll/h7u0;

    .line 110
    .line 111
    .line 112
    move-result-object p3

    .line 113
    new-instance v1, Ll/qdv0;

    .line 114
    .line 115
    invoke-direct {v1, v0}, Ll/qdv0;-><init>(Ll/wit0;)V

    .line 116
    .line 117
    .line 118
    sget-object v2, Ll/oct0;->f:Ll/xvw0;

    .line 119
    .line 120
    invoke-virtual {p3, v1, v2}, Ll/kdu0;->q0(Ljava/lang/Object;Ljava/util/concurrent/Executor;)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {p1}, Ll/vwt0;->j()Ll/ktu0;

    .line 124
    .line 125
    .line 126
    iget-object p3, p2, Ll/q6w0;->t:Ll/u6w0;

    .line 127
    .line 128
    iget-object v1, p3, Ll/u6w0;->b:Ljava/lang/String;

    .line 129
    .line 130
    iget-object p3, p3, Ll/u6w0;->a:Ljava/lang/String;

    .line 131
    .line 132
    invoke-static {v0, v1, p3}, Ll/ktu0;->j(Ll/wit0;Ljava/lang/String;Ljava/lang/String;)Ll/hpr;

    .line 133
    .line 134
    .line 135
    move-result-object p3

    .line 136
    iget-boolean p2, p2, Ll/q6w0;->N:Z

    .line 137
    .line 138
    if-eqz p2, :cond_1

    .line 139
    .line 140
    new-instance p2, Ll/rdv0;

    .line 141
    .line 142
    invoke-direct {p2, v0}, Ll/rdv0;-><init>(Ll/wit0;)V

    .line 143
    .line 144
    .line 145
    iget-object v1, p0, Ll/vdv0;->e:Ljava/util/concurrent/Executor;

    .line 146
    .line 147
    invoke-interface {p3, p2, v1}, Ll/hpr;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    .line 148
    .line 149
    .line 150
    :cond_1
    new-instance p2, Ll/sdv0;

    .line 151
    .line 152
    invoke-direct {p2, p0, v0}, Ll/sdv0;-><init>(Ll/vdv0;Ll/wit0;)V

    .line 153
    .line 154
    .line 155
    iget-object p0, p0, Ll/vdv0;->e:Ljava/util/concurrent/Executor;

    .line 156
    .line 157
    invoke-interface {p3, p2, p0}, Ll/hpr;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    .line 158
    .line 159
    .line 160
    new-instance p0, Ll/tdv0;

    .line 161
    .line 162
    invoke-direct {p0, p1}, Ll/tdv0;-><init>(Ll/vwt0;)V

    .line 163
    .line 164
    .line 165
    invoke-static {p3, p0, v2}, Ll/pvw0;->m(Ll/hpr;Ll/eow0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 166
    .line 167
    .line 168
    move-result-object p0

    .line 169
    return-object p0
.end method

.method public final synthetic d(Ll/wit0;)V
    .locals 1

    .line 1
    invoke-interface {p1}, Ll/wit0;->p0()V

    .line 2
    .line 3
    .line 4
    invoke-interface {p1}, Ll/wit0;->a()Ll/yjt0;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object p0, p0, Ll/vdv0;->d:Ll/o7w0;

    .line 9
    .line 10
    iget-object p0, p0, Ll/o7w0;->a:Lcom/google/android/gms/ads/internal/client/zzfk;

    .line 11
    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {v0, p0}, Ll/yjt0;->s8(Lcom/google/android/gms/ads/internal/client/zzfk;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    sget-object p0, Ll/sgs0;->i1:Ll/dgs0;

    .line 20
    .line 21
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0, p0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    check-cast p0, Ljava/lang/Boolean;

    .line 30
    .line 31
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_1

    .line 36
    .line 37
    invoke-interface {p1}, Ll/wit0;->isAttachedToWindow()Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-nez p0, :cond_1

    .line 42
    .line 43
    invoke-interface {p1}, Ll/wit0;->onPause()V

    .line 44
    .line 45
    .line 46
    const/4 p0, 0x1

    .line 47
    invoke-interface {p1, p0}, Ll/wit0;->E(Z)V

    .line 48
    .line 49
    .line 50
    :cond_1
    return-void
.end method
