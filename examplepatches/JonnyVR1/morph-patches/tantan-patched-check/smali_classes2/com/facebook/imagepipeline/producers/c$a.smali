.class public Lcom/facebook/imagepipeline/producers/c$a;
.super Ll/pud;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/imagepipeline/producers/c;
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


# direct methods
.method public constructor <init>(Ll/z06;Ll/yk90;Ll/a7h0;Ll/cy3;)V
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
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/pud;-><init>(Ll/z06;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lcom/facebook/imagepipeline/producers/c$a;->c:Ll/yk90;

    .line 5
    .line 6
    iput-object p3, p0, Lcom/facebook/imagepipeline/producers/c$a;->d:Ll/a7h0;

    .line 7
    .line 8
    iput-object p4, p0, Lcom/facebook/imagepipeline/producers/c$a;->e:Ll/cy3;

    .line 9
    .line 10
    return-void
.end method

.method public synthetic constructor <init>(Ll/z06;Ll/yk90;Ll/a7h0;Ll/cy3;Ll/f4e;)V
    .locals 0

    .line 11
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/facebook/imagepipeline/producers/c$a;-><init>(Ll/z06;Ll/yk90;Ll/a7h0;Ll/cy3;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic h(Ljava/lang/Object;I)V
    .locals 0

    .line 1
    check-cast p1, Ll/n0f;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/facebook/imagepipeline/producers/c$a;->p(Ll/n0f;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public p(Ll/n0f;I)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/c$a;->c:Ll/yk90;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/yk90;->n()Ll/cl90;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/facebook/imagepipeline/producers/c$a;->c:Ll/yk90;

    .line 8
    .line 9
    const-string v2, "DiskCacheWriteProducer"

    .line 10
    .line 11
    invoke-interface {v0, v1, v2}, Ll/cl90;->d(Ll/yk90;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p2}, Ll/ji2;->e(I)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    const/4 v1, 0x0

    .line 19
    if-nez v0, :cond_2

    .line 20
    .line 21
    if-eqz p1, :cond_2

    .line 22
    .line 23
    const/16 v0, 0xa

    .line 24
    .line 25
    invoke-static {p2, v0}, Ll/ji2;->l(II)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_2

    .line 30
    .line 31
    invoke-virtual {p1}, Ll/n0f;->F()Ll/him;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    sget-object v3, Ll/him;->c:Ll/him;

    .line 36
    .line 37
    if-ne v0, v3, :cond_0

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/c$a;->c:Ll/yk90;

    .line 41
    .line 42
    invoke-interface {v0}, Ll/yk90;->t()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iget-object v3, p0, Lcom/facebook/imagepipeline/producers/c$a;->e:Ll/cy3;

    .line 47
    .line 48
    iget-object v4, p0, Lcom/facebook/imagepipeline/producers/c$a;->c:Ll/yk90;

    .line 49
    .line 50
    invoke-interface {v4}, Ll/yk90;->k()Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v4

    .line 54
    invoke-interface {v3, v0, v4}, Ll/cy3;->b(Lcom/facebook/imagepipeline/request/ImageRequest;Ljava/lang/Object;)Ll/by3;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    iget-object v4, p0, Lcom/facebook/imagepipeline/producers/c$a;->d:Ll/a7h0;

    .line 59
    .line 60
    invoke-interface {v4}, Ll/a7h0;->get()Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v4

    .line 64
    check-cast v4, Ll/g4e;

    .line 65
    .line 66
    invoke-interface {v4}, Ll/g4e;->b()Ll/mh3;

    .line 67
    .line 68
    .line 69
    move-result-object v5

    .line 70
    invoke-interface {v4}, Ll/g4e;->c()Ll/mh3;

    .line 71
    .line 72
    .line 73
    move-result-object v6

    .line 74
    invoke-interface {v4}, Ll/g4e;->d()Lcom/facebook/common/internal/ImmutableMap;

    .line 75
    .line 76
    .line 77
    move-result-object v4

    .line 78
    invoke-static {v0, v5, v6, v4}, Lcom/facebook/imagepipeline/producers/DiskCacheDecision;->a(Lcom/facebook/imagepipeline/request/ImageRequest;Ll/mh3;Ll/mh3;Ljava/util/Map;)Ll/mh3;

    .line 79
    .line 80
    .line 81
    move-result-object v4

    .line 82
    if-nez v4, :cond_1

    .line 83
    .line 84
    iget-object v3, p0, Lcom/facebook/imagepipeline/producers/c$a;->c:Ll/yk90;

    .line 85
    .line 86
    invoke-interface {v3}, Ll/yk90;->n()Ll/cl90;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    iget-object v4, p0, Lcom/facebook/imagepipeline/producers/c$a;->c:Ll/yk90;

    .line 91
    .line 92
    new-instance v5, Lcom/facebook/imagepipeline/producers/DiskCacheDecision$DiskCacheDecisionNoDiskCacheChosenException;

    .line 93
    .line 94
    new-instance v6, Ljava/lang/StringBuilder;

    .line 95
    .line 96
    const-string v7, "Got no disk cache for CacheChoice: "

    .line 97
    .line 98
    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {v0}, Lcom/facebook/imagepipeline/request/ImageRequest;->d()Lcom/facebook/imagepipeline/request/ImageRequest$CacheChoice;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-virtual {v0}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    invoke-direct {v5, v0}, Lcom/facebook/imagepipeline/producers/DiskCacheDecision$DiskCacheDecisionNoDiskCacheChosenException;-><init>(Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    invoke-interface {v3, v4, v2, v5, v1}, Ll/cl90;->i(Ll/yk90;Ljava/lang/String;Ljava/lang/Throwable;Ljava/util/Map;)V

    .line 128
    .line 129
    .line 130
    invoke-virtual {p0}, Ll/pud;->o()Ll/z06;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    invoke-interface {p0, p1, p2}, Ll/z06;->b(Ljava/lang/Object;I)V

    .line 135
    .line 136
    .line 137
    return-void

    .line 138
    :cond_1
    invoke-virtual {v4, v3, p1}, Ll/mh3;->i(Ll/by3;Ll/n0f;)V

    .line 139
    .line 140
    .line 141
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/c$a;->c:Ll/yk90;

    .line 142
    .line 143
    invoke-interface {v0}, Ll/yk90;->n()Ll/cl90;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    iget-object v3, p0, Lcom/facebook/imagepipeline/producers/c$a;->c:Ll/yk90;

    .line 148
    .line 149
    invoke-interface {v0, v3, v2, v1}, Ll/cl90;->f(Ll/yk90;Ljava/lang/String;Ljava/util/Map;)V

    .line 150
    .line 151
    .line 152
    invoke-virtual {p0}, Ll/pud;->o()Ll/z06;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    invoke-interface {p0, p1, p2}, Ll/z06;->b(Ljava/lang/Object;I)V

    .line 157
    .line 158
    .line 159
    return-void

    .line 160
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/c$a;->c:Ll/yk90;

    .line 161
    .line 162
    invoke-interface {v0}, Ll/yk90;->n()Ll/cl90;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    iget-object v3, p0, Lcom/facebook/imagepipeline/producers/c$a;->c:Ll/yk90;

    .line 167
    .line 168
    invoke-interface {v0, v3, v2, v1}, Ll/cl90;->f(Ll/yk90;Ljava/lang/String;Ljava/util/Map;)V

    .line 169
    .line 170
    .line 171
    invoke-virtual {p0}, Ll/pud;->o()Ll/z06;

    .line 172
    .line 173
    .line 174
    move-result-object p0

    .line 175
    invoke-interface {p0, p1, p2}, Ll/z06;->b(Ljava/lang/Object;I)V

    .line 176
    .line 177
    .line 178
    return-void
.end method
