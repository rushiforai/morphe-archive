.class public Ll/b33$a;
.super Ll/pud;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/b33;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/pud<",
        "Ll/fb5<",
        "Ll/db5;",
        ">;",
        "Ll/fb5<",
        "Ll/db5;",
        ">;>;"
    }
.end annotation


# instance fields
.field public final c:Ll/yk90;

.field public final d:Ll/mpy;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/mpy<",
            "Ll/by3;",
            "Lcom/facebook/common/memory/PooledByteBuffer;",
            ">;"
        }
    .end annotation
.end field

.field public final e:Ll/a7h0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/a7h0<",
            "Ll/g4e;",
            ">;"
        }
    .end annotation
.end field

.field public final f:Ll/cy3;

.field public final g:Ll/ye3;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ye3<",
            "Ll/by3;",
            ">;"
        }
    .end annotation
.end field

.field public final h:Ll/ye3;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ye3<",
            "Ll/by3;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/z06;Ll/yk90;Ll/mpy;Ll/a7h0;Ll/cy3;Ll/ye3;Ll/ye3;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z06<",
            "Ll/fb5<",
            "Ll/db5;",
            ">;>;",
            "Ll/yk90;",
            "Ll/mpy<",
            "Ll/by3;",
            "Lcom/facebook/common/memory/PooledByteBuffer;",
            ">;",
            "Ll/a7h0<",
            "Ll/g4e;",
            ">;",
            "Ll/cy3;",
            "Ll/ye3<",
            "Ll/by3;",
            ">;",
            "Ll/ye3<",
            "Ll/by3;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/pud;-><init>(Ll/z06;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/b33$a;->c:Ll/yk90;

    .line 5
    .line 6
    iput-object p3, p0, Ll/b33$a;->d:Ll/mpy;

    .line 7
    .line 8
    iput-object p4, p0, Ll/b33$a;->e:Ll/a7h0;

    .line 9
    .line 10
    iput-object p5, p0, Ll/b33$a;->f:Ll/cy3;

    .line 11
    .line 12
    iput-object p6, p0, Ll/b33$a;->g:Ll/ye3;

    .line 13
    .line 14
    iput-object p7, p0, Ll/b33$a;->h:Ll/ye3;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public bridge synthetic h(Ljava/lang/Object;I)V
    .locals 0

    .line 1
    check-cast p1, Ll/fb5;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/b33$a;->p(Ll/fb5;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public p(Ll/fb5;I)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/fb5<",
            "Ll/db5;",
            ">;I)V"
        }
    .end annotation

    .line 1
    :try_start_0
    invoke-static {}, Ll/i9j;->d()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "BitmapProbeProducer#onNewResultImpl"

    .line 8
    .line 9
    invoke-static {v0}, Ll/i9j;->a(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    invoke-static {p2}, Ll/ji2;->e(I)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_6

    .line 17
    .line 18
    if-eqz p1, :cond_6

    .line 19
    .line 20
    const/16 v0, 0x8

    .line 21
    .line 22
    invoke-static {p2, v0}, Ll/ji2;->l(II)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    goto/16 :goto_2

    .line 29
    .line 30
    :cond_1
    iget-object v0, p0, Ll/b33$a;->c:Ll/yk90;

    .line 31
    .line 32
    invoke-interface {v0}, Ll/yk90;->t()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iget-object v1, p0, Ll/b33$a;->f:Ll/cy3;

    .line 37
    .line 38
    iget-object v2, p0, Ll/b33$a;->c:Ll/yk90;

    .line 39
    .line 40
    invoke-interface {v2}, Ll/yk90;->k()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-interface {v1, v0, v2}, Ll/cy3;->b(Lcom/facebook/imagepipeline/request/ImageRequest;Ljava/lang/Object;)Ll/by3;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    iget-object v2, p0, Ll/b33$a;->c:Ll/yk90;

    .line 49
    .line 50
    const-string v3, "origin"

    .line 51
    .line 52
    invoke-interface {v2, v3}, Ll/lyk;->e(Ljava/lang/String;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    check-cast v2, Ljava/lang/String;

    .line 57
    .line 58
    if-eqz v2, :cond_5

    .line 59
    .line 60
    const-string v3, "memory_bitmap"

    .line 61
    .line 62
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    if-eqz v2, :cond_5

    .line 67
    .line 68
    iget-object v2, p0, Ll/b33$a;->c:Ll/yk90;

    .line 69
    .line 70
    invoke-interface {v2}, Ll/yk90;->m()Ll/tjm;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    invoke-interface {v2}, Ll/tjm;->n()Ll/ujm;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    invoke-virtual {v2}, Ll/ujm;->E()Z

    .line 79
    .line 80
    .line 81
    move-result v2

    .line 82
    if-eqz v2, :cond_2

    .line 83
    .line 84
    iget-object v2, p0, Ll/b33$a;->g:Ll/ye3;

    .line 85
    .line 86
    invoke-virtual {v2, v1}, Ll/ye3;->b(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    move-result v2

    .line 90
    if-nez v2, :cond_2

    .line 91
    .line 92
    iget-object v2, p0, Ll/b33$a;->d:Ll/mpy;

    .line 93
    .line 94
    invoke-interface {v2, v1}, Ll/mpy;->a(Ljava/lang/Object;)V

    .line 95
    .line 96
    .line 97
    iget-object v2, p0, Ll/b33$a;->g:Ll/ye3;

    .line 98
    .line 99
    invoke-virtual {v2, v1}, Ll/ye3;->a(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    :cond_2
    iget-object v2, p0, Ll/b33$a;->c:Ll/yk90;

    .line 103
    .line 104
    invoke-interface {v2}, Ll/yk90;->m()Ll/tjm;

    .line 105
    .line 106
    .line 107
    move-result-object v2

    .line 108
    invoke-interface {v2}, Ll/tjm;->n()Ll/ujm;

    .line 109
    .line 110
    .line 111
    move-result-object v2

    .line 112
    invoke-virtual {v2}, Ll/ujm;->C()Z

    .line 113
    .line 114
    .line 115
    move-result v2

    .line 116
    if-eqz v2, :cond_5

    .line 117
    .line 118
    iget-object v2, p0, Ll/b33$a;->h:Ll/ye3;

    .line 119
    .line 120
    invoke-virtual {v2, v1}, Ll/ye3;->b(Ljava/lang/Object;)Z

    .line 121
    .line 122
    .line 123
    move-result v2

    .line 124
    if-nez v2, :cond_5

    .line 125
    .line 126
    invoke-virtual {v0}, Lcom/facebook/imagepipeline/request/ImageRequest;->d()Lcom/facebook/imagepipeline/request/ImageRequest$CacheChoice;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    sget-object v2, Lcom/facebook/imagepipeline/request/ImageRequest$CacheChoice;->SMALL:Lcom/facebook/imagepipeline/request/ImageRequest$CacheChoice;

    .line 131
    .line 132
    if-ne v0, v2, :cond_3

    .line 133
    .line 134
    const/4 v0, 0x1

    .line 135
    goto :goto_0

    .line 136
    :cond_3
    const/4 v0, 0x0

    .line 137
    :goto_0
    iget-object v2, p0, Ll/b33$a;->e:Ll/a7h0;

    .line 138
    .line 139
    invoke-interface {v2}, Ll/a7h0;->get()Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    move-result-object v2

    .line 143
    check-cast v2, Ll/g4e;

    .line 144
    .line 145
    if-eqz v0, :cond_4

    .line 146
    .line 147
    invoke-interface {v2}, Ll/g4e;->b()Ll/mh3;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    goto :goto_1

    .line 152
    :cond_4
    invoke-interface {v2}, Ll/g4e;->c()Ll/mh3;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    :goto_1
    invoke-virtual {v0, v1}, Ll/mh3;->e(Ll/by3;)V

    .line 157
    .line 158
    .line 159
    iget-object v0, p0, Ll/b33$a;->h:Ll/ye3;

    .line 160
    .line 161
    invoke-virtual {v0, v1}, Ll/ye3;->a(Ljava/lang/Object;)Z

    .line 162
    .line 163
    .line 164
    :cond_5
    invoke-virtual {p0}, Ll/pud;->o()Ll/z06;

    .line 165
    .line 166
    .line 167
    move-result-object p0

    .line 168
    invoke-interface {p0, p1, p2}, Ll/z06;->b(Ljava/lang/Object;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 169
    .line 170
    .line 171
    invoke-static {}, Ll/i9j;->d()Z

    .line 172
    .line 173
    .line 174
    move-result p0

    .line 175
    if-eqz p0, :cond_7

    .line 176
    .line 177
    invoke-static {}, Ll/i9j;->b()V

    .line 178
    .line 179
    .line 180
    return-void

    .line 181
    :cond_6
    :goto_2
    :try_start_1
    invoke-virtual {p0}, Ll/pud;->o()Ll/z06;

    .line 182
    .line 183
    .line 184
    move-result-object p0

    .line 185
    invoke-interface {p0, p1, p2}, Ll/z06;->b(Ljava/lang/Object;I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 186
    .line 187
    .line 188
    invoke-static {}, Ll/i9j;->d()Z

    .line 189
    .line 190
    .line 191
    move-result p0

    .line 192
    if-eqz p0, :cond_7

    .line 193
    .line 194
    invoke-static {}, Ll/i9j;->b()V

    .line 195
    .line 196
    .line 197
    :cond_7
    return-void

    .line 198
    :catchall_0
    move-exception p0

    .line 199
    invoke-static {}, Ll/i9j;->d()Z

    .line 200
    .line 201
    .line 202
    move-result p1

    .line 203
    if-eqz p1, :cond_8

    .line 204
    .line 205
    invoke-static {}, Ll/i9j;->b()V

    .line 206
    .line 207
    .line 208
    :cond_8
    throw p0
.end method
