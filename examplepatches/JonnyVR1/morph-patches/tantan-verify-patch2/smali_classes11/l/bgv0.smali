.class public final Ll/bgv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ucv0;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Ll/qju0;

.field public final c:Ljava/util/concurrent/Executor;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/qju0;Ljava/util/concurrent/Executor;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/bgv0;->a:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Ll/bgv0;->b:Ll/qju0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/bgv0;->c:Ljava/util/concurrent/Executor;

    .line 9
    .line 10
    return-void
.end method

.method public static final c(Ll/b7w0;I)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b7w0;->a:Ll/y6w0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/y6w0;->a:Ll/o7w0;

    .line 4
    .line 5
    iget-object p0, p0, Ll/o7w0;->g:Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method


# virtual methods
.method public final bridge synthetic a(Ll/b7w0;Ll/q6w0;Ll/scv0;)Ljava/lang/Object;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzfho;,
            Lcom/google/android/gms/internal/ads/zzeml;
        }
    .end annotation

    .line 1
    iget-object v0, p3, Ll/scv0;->b:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ll/r8w0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/r8w0;->d()Ll/nxs0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p3, Ll/scv0;->b:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v1, Ll/r8w0;

    .line 12
    .line 13
    invoke-virtual {v1}, Ll/r8w0;->e()Ll/oxs0;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iget-object v2, p3, Ll/scv0;->b:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast v2, Ll/r8w0;

    .line 20
    .line 21
    invoke-virtual {v2}, Ll/r8w0;->i()Ll/rxs0;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    const/4 v3, 0x1

    .line 26
    const/4 v4, 0x6

    .line 27
    if-eqz v2, :cond_0

    .line 28
    .line 29
    invoke-static {p1, v4}, Ll/bgv0;->c(Ll/b7w0;I)Z

    .line 30
    .line 31
    .line 32
    move-result v5

    .line 33
    if-eqz v5, :cond_0

    .line 34
    .line 35
    invoke-static {v2}, Ll/ulu0;->g0(Ll/rxs0;)Ll/ulu0;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    goto :goto_0

    .line 40
    :cond_0
    if-eqz v0, :cond_1

    .line 41
    .line 42
    invoke-static {p1, v4}, Ll/bgv0;->c(Ll/b7w0;I)Z

    .line 43
    .line 44
    .line 45
    move-result v5

    .line 46
    if-eqz v5, :cond_1

    .line 47
    .line 48
    invoke-static {v0}, Ll/ulu0;->J(Ll/nxs0;)Ll/ulu0;

    .line 49
    .line 50
    .line 51
    move-result-object v4

    .line 52
    goto :goto_0

    .line 53
    :cond_1
    if-eqz v0, :cond_2

    .line 54
    .line 55
    const/4 v5, 0x2

    .line 56
    invoke-static {p1, v5}, Ll/bgv0;->c(Ll/b7w0;I)Z

    .line 57
    .line 58
    .line 59
    move-result v5

    .line 60
    if-eqz v5, :cond_2

    .line 61
    .line 62
    invoke-static {v0}, Ll/ulu0;->H(Ll/nxs0;)Ll/ulu0;

    .line 63
    .line 64
    .line 65
    move-result-object v4

    .line 66
    goto :goto_0

    .line 67
    :cond_2
    if-eqz v1, :cond_3

    .line 68
    .line 69
    invoke-static {p1, v4}, Ll/bgv0;->c(Ll/b7w0;I)Z

    .line 70
    .line 71
    .line 72
    move-result v4

    .line 73
    if-eqz v4, :cond_3

    .line 74
    .line 75
    invoke-static {v1}, Ll/ulu0;->K(Ll/oxs0;)Ll/ulu0;

    .line 76
    .line 77
    .line 78
    move-result-object v4

    .line 79
    goto :goto_0

    .line 80
    :cond_3
    if-eqz v1, :cond_5

    .line 81
    .line 82
    invoke-static {p1, v3}, Ll/bgv0;->c(Ll/b7w0;I)Z

    .line 83
    .line 84
    .line 85
    move-result v4

    .line 86
    if-eqz v4, :cond_5

    .line 87
    .line 88
    invoke-static {v1}, Ll/ulu0;->I(Ll/oxs0;)Ll/ulu0;

    .line 89
    .line 90
    .line 91
    move-result-object v4

    .line 92
    :goto_0
    iget-object v5, p1, Ll/b7w0;->a:Ll/y6w0;

    .line 93
    .line 94
    iget-object v5, v5, Ll/y6w0;->a:Ll/o7w0;

    .line 95
    .line 96
    invoke-virtual {v4}, Ll/ulu0;->P()I

    .line 97
    .line 98
    .line 99
    move-result v6

    .line 100
    invoke-static {v6}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v6

    .line 104
    iget-object v5, v5, Ll/o7w0;->g:Ljava/util/ArrayList;

    .line 105
    .line 106
    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 107
    .line 108
    .line 109
    move-result v5

    .line 110
    if-eqz v5, :cond_4

    .line 111
    .line 112
    iget-object v3, p0, Ll/bgv0;->b:Ll/qju0;

    .line 113
    .line 114
    iget-object v5, p3, Ll/scv0;->a:Ljava/lang/String;

    .line 115
    .line 116
    new-instance v6, Ll/a0u0;

    .line 117
    .line 118
    invoke-direct {v6, p1, p2, v5}, Ll/a0u0;-><init>(Ll/b7w0;Ll/q6w0;Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    new-instance p1, Ll/gmu0;

    .line 122
    .line 123
    invoke-direct {p1, v4}, Ll/gmu0;-><init>(Ll/ulu0;)V

    .line 124
    .line 125
    .line 126
    new-instance p2, Ll/jou0;

    .line 127
    .line 128
    invoke-direct {p2, v1, v0, v2}, Ll/jou0;-><init>(Ll/oxs0;Ll/nxs0;Ll/rxs0;)V

    .line 129
    .line 130
    .line 131
    invoke-virtual {v3, v6, p1, p2}, Ll/qju0;->d(Ll/a0u0;Ll/gmu0;Ll/jou0;)Ll/wlu0;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    iget-object p2, p3, Ll/scv0;->c:Ll/g8u0;

    .line 136
    .line 137
    check-cast p2, Ll/vev0;

    .line 138
    .line 139
    invoke-virtual {p1}, Ll/lzt0;->g()Ll/ijv0;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    invoke-virtual {p2, v0}, Ll/vev0;->p8(Ll/jxs0;)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {p1}, Ll/lzt0;->c()Ll/o7u0;

    .line 147
    .line 148
    .line 149
    move-result-object p2

    .line 150
    iget-object p3, p3, Ll/scv0;->b:Ljava/lang/Object;

    .line 151
    .line 152
    new-instance v0, Ll/ntt0;

    .line 153
    .line 154
    check-cast p3, Ll/r8w0;

    .line 155
    .line 156
    invoke-direct {v0, p3}, Ll/ntt0;-><init>(Ll/r8w0;)V

    .line 157
    .line 158
    .line 159
    iget-object p0, p0, Ll/bgv0;->c:Ljava/util/concurrent/Executor;

    .line 160
    .line 161
    invoke-virtual {p2, v0, p0}, Ll/kdu0;->q0(Ljava/lang/Object;Ljava/util/concurrent/Executor;)V

    .line 162
    .line 163
    .line 164
    invoke-virtual {p1}, Ll/xlu0;->h()Ll/ilu0;

    .line 165
    .line 166
    .line 167
    move-result-object p0

    .line 168
    return-object p0

    .line 169
    :cond_4
    new-instance p0, Lcom/google/android/gms/internal/ads/zzeml;

    .line 170
    .line 171
    const-string p1, "No corresponding native ad listener"

    .line 172
    .line 173
    invoke-direct {p0, v3, p1}, Lcom/google/android/gms/internal/ads/zzeml;-><init>(ILjava/lang/String;)V

    .line 174
    .line 175
    .line 176
    throw p0

    .line 177
    :cond_5
    new-instance p0, Lcom/google/android/gms/internal/ads/zzeml;

    .line 178
    .line 179
    const-string p1, "No native ad mappers"

    .line 180
    .line 181
    invoke-direct {p0, v3, p1}, Lcom/google/android/gms/internal/ads/zzeml;-><init>(ILjava/lang/String;)V

    .line 182
    .line 183
    .line 184
    throw p0
.end method

.method public final b(Ll/b7w0;Ll/q6w0;Ll/scv0;)V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzfho;
        }
    .end annotation

    .line 1
    iget-object v0, p3, Ll/scv0;->b:Ljava/lang/Object;

    .line 2
    .line 3
    move-object v1, v0

    .line 4
    check-cast v1, Ll/r8w0;

    .line 5
    .line 6
    iget-object v0, p1, Ll/b7w0;->a:Ll/y6w0;

    .line 7
    .line 8
    iget-object v0, v0, Ll/y6w0;->a:Ll/o7w0;

    .line 9
    .line 10
    iget-object v2, p2, Ll/q6w0;->w:Lorg/json/JSONObject;

    .line 11
    .line 12
    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v4

    .line 16
    iget-object p2, p2, Ll/q6w0;->t:Ll/u6w0;

    .line 17
    .line 18
    invoke-static {p2}, Ll/v0t0;->l(Ll/u6w0;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v5

    .line 22
    iget-object p2, p3, Ll/scv0;->c:Ll/g8u0;

    .line 23
    .line 24
    move-object v6, p2

    .line 25
    check-cast v6, Ll/jxs0;

    .line 26
    .line 27
    iget-object p1, p1, Ll/b7w0;->a:Ll/y6w0;

    .line 28
    .line 29
    iget-object p1, p1, Ll/y6w0;->a:Ll/o7w0;

    .line 30
    .line 31
    iget-object v7, p1, Ll/o7w0;->i:Lcom/google/android/gms/internal/ads/zzbjb;

    .line 32
    .line 33
    iget-object v2, p0, Ll/bgv0;->a:Landroid/content/Context;

    .line 34
    .line 35
    iget-object v3, v0, Ll/o7w0;->d:Lcom/google/android/gms/ads/internal/client/zzl;

    .line 36
    .line 37
    iget-object v8, p1, Ll/o7w0;->g:Ljava/util/ArrayList;

    .line 38
    .line 39
    invoke-virtual/range {v1 .. v8}, Ll/r8w0;->u(Landroid/content/Context;Lcom/google/android/gms/ads/internal/client/zzl;Ljava/lang/String;Ljava/lang/String;Ll/jxs0;Lcom/google/android/gms/internal/ads/zzbjb;Ljava/util/List;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method
