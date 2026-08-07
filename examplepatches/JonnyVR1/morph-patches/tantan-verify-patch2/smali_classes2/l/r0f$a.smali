.class public Ll/r0f$a;
.super Ll/pud;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/r0f;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/pud<",
        "Ll/n0f;",
        "Ll/n0f;",
        ">;"
    }
.end annotation


# instance fields
.field public final c:Ll/yk90;

.field public final d:Ll/a7h0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/a7h0<",
            "Ll/g4e;",
            ">;"
        }
    .end annotation
.end field

.field public final e:Ll/cy3;

.field public final f:Ll/ye3;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ye3<",
            "Ll/by3;",
            ">;"
        }
    .end annotation
.end field

.field public final g:Ll/ye3;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ye3<",
            "Ll/by3;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/z06;Ll/yk90;Ll/a7h0;Ll/cy3;Ll/ye3;Ll/ye3;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z06<",
            "Ll/n0f;",
            ">;",
            "Ll/yk90;",
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
    iput-object p2, p0, Ll/r0f$a;->c:Ll/yk90;

    .line 5
    .line 6
    iput-object p3, p0, Ll/r0f$a;->d:Ll/a7h0;

    .line 7
    .line 8
    iput-object p4, p0, Ll/r0f$a;->e:Ll/cy3;

    .line 9
    .line 10
    iput-object p5, p0, Ll/r0f$a;->f:Ll/ye3;

    .line 11
    .line 12
    iput-object p6, p0, Ll/r0f$a;->g:Ll/ye3;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public bridge synthetic h(Ljava/lang/Object;I)V
    .locals 0

    .line 1
    check-cast p1, Ll/n0f;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/r0f$a;->p(Ll/n0f;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public p(Ll/n0f;I)V
    .locals 5

    .line 1
    const-string v0, "origin"

    .line 2
    .line 3
    :try_start_0
    invoke-static {}, Ll/i9j;->d()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    const-string v1, "EncodedProbeProducer#onNewResultImpl"

    .line 10
    .line 11
    invoke-static {v1}, Ll/i9j;->a(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-static {p2}, Ll/ji2;->e(I)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-nez v1, :cond_6

    .line 19
    .line 20
    if-eqz p1, :cond_6

    .line 21
    .line 22
    const/16 v1, 0xa

    .line 23
    .line 24
    invoke-static {p2, v1}, Ll/ji2;->l(II)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-nez v1, :cond_6

    .line 29
    .line 30
    invoke-virtual {p1}, Ll/n0f;->F()Ll/him;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    sget-object v2, Ll/him;->c:Ll/him;

    .line 35
    .line 36
    if-ne v1, v2, :cond_1

    .line 37
    .line 38
    goto/16 :goto_3

    .line 39
    .line 40
    :cond_1
    iget-object v1, p0, Ll/r0f$a;->c:Ll/yk90;

    .line 41
    .line 42
    invoke-interface {v1}, Ll/yk90;->t()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    iget-object v2, p0, Ll/r0f$a;->e:Ll/cy3;

    .line 47
    .line 48
    iget-object v3, p0, Ll/r0f$a;->c:Ll/yk90;

    .line 49
    .line 50
    invoke-interface {v3}, Ll/yk90;->k()Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    invoke-interface {v2, v1, v3}, Ll/cy3;->b(Lcom/facebook/imagepipeline/request/ImageRequest;Ljava/lang/Object;)Ll/by3;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    iget-object v3, p0, Ll/r0f$a;->f:Ll/ye3;

    .line 59
    .line 60
    invoke-virtual {v3, v2}, Ll/ye3;->a(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    const-string v3, "memory_encoded"

    .line 64
    .line 65
    iget-object v4, p0, Ll/r0f$a;->c:Ll/yk90;

    .line 66
    .line 67
    invoke-interface {v4, v0}, Ll/lyk;->e(Ljava/lang/String;)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v4

    .line 71
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result v3

    .line 75
    if-eqz v3, :cond_4

    .line 76
    .line 77
    iget-object v0, p0, Ll/r0f$a;->g:Ll/ye3;

    .line 78
    .line 79
    invoke-virtual {v0, v2}, Ll/ye3;->b(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-nez v0, :cond_5

    .line 84
    .line 85
    invoke-virtual {v1}, Lcom/facebook/imagepipeline/request/ImageRequest;->d()Lcom/facebook/imagepipeline/request/ImageRequest$CacheChoice;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    sget-object v1, Lcom/facebook/imagepipeline/request/ImageRequest$CacheChoice;->SMALL:Lcom/facebook/imagepipeline/request/ImageRequest$CacheChoice;

    .line 90
    .line 91
    if-ne v0, v1, :cond_2

    .line 92
    .line 93
    const/4 v0, 0x1

    .line 94
    goto :goto_0

    .line 95
    :cond_2
    const/4 v0, 0x0

    .line 96
    :goto_0
    iget-object v1, p0, Ll/r0f$a;->d:Ll/a7h0;

    .line 97
    .line 98
    invoke-interface {v1}, Ll/a7h0;->get()Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    check-cast v1, Ll/g4e;

    .line 103
    .line 104
    if-eqz v0, :cond_3

    .line 105
    .line 106
    invoke-interface {v1}, Ll/g4e;->b()Ll/mh3;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    goto :goto_1

    .line 111
    :cond_3
    invoke-interface {v1}, Ll/g4e;->c()Ll/mh3;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    :goto_1
    invoke-virtual {v0, v2}, Ll/mh3;->e(Ll/by3;)V

    .line 116
    .line 117
    .line 118
    iget-object v0, p0, Ll/r0f$a;->g:Ll/ye3;

    .line 119
    .line 120
    invoke-virtual {v0, v2}, Ll/ye3;->a(Ljava/lang/Object;)Z

    .line 121
    .line 122
    .line 123
    goto :goto_2

    .line 124
    :cond_4
    const-string v1, "disk"

    .line 125
    .line 126
    iget-object v3, p0, Ll/r0f$a;->c:Ll/yk90;

    .line 127
    .line 128
    invoke-interface {v3, v0}, Ll/lyk;->e(Ljava/lang/String;)Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 133
    .line 134
    .line 135
    move-result v0

    .line 136
    if-eqz v0, :cond_5

    .line 137
    .line 138
    iget-object v0, p0, Ll/r0f$a;->g:Ll/ye3;

    .line 139
    .line 140
    invoke-virtual {v0, v2}, Ll/ye3;->a(Ljava/lang/Object;)Z

    .line 141
    .line 142
    .line 143
    :cond_5
    :goto_2
    invoke-virtual {p0}, Ll/pud;->o()Ll/z06;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    invoke-interface {p0, p1, p2}, Ll/z06;->b(Ljava/lang/Object;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 148
    .line 149
    .line 150
    invoke-static {}, Ll/i9j;->d()Z

    .line 151
    .line 152
    .line 153
    move-result p0

    .line 154
    if-eqz p0, :cond_7

    .line 155
    .line 156
    invoke-static {}, Ll/i9j;->b()V

    .line 157
    .line 158
    .line 159
    return-void

    .line 160
    :cond_6
    :goto_3
    :try_start_1
    invoke-virtual {p0}, Ll/pud;->o()Ll/z06;

    .line 161
    .line 162
    .line 163
    move-result-object p0

    .line 164
    invoke-interface {p0, p1, p2}, Ll/z06;->b(Ljava/lang/Object;I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 165
    .line 166
    .line 167
    invoke-static {}, Ll/i9j;->d()Z

    .line 168
    .line 169
    .line 170
    move-result p0

    .line 171
    if-eqz p0, :cond_7

    .line 172
    .line 173
    invoke-static {}, Ll/i9j;->b()V

    .line 174
    .line 175
    .line 176
    :cond_7
    return-void

    .line 177
    :catchall_0
    move-exception p0

    .line 178
    invoke-static {}, Ll/i9j;->d()Z

    .line 179
    .line 180
    .line 181
    move-result p1

    .line 182
    if-eqz p1, :cond_8

    .line 183
    .line 184
    invoke-static {}, Ll/i9j;->b()V

    .line 185
    .line 186
    .line 187
    :cond_8
    throw p0
.end method
