.class public Ll/em80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wk90;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/em80$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/wk90<",
        "Ll/fb5<",
        "Ll/db5;",
        ">;>;"
    }
.end annotation


# instance fields
.field public final a:Ll/mpy;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/mpy<",
            "Ll/by3;",
            "Ll/db5;",
            ">;"
        }
    .end annotation
.end field

.field public final b:Ll/cy3;

.field public final c:Ll/wk90;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/wk90<",
            "Ll/fb5<",
            "Ll/db5;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/mpy;Ll/cy3;Ll/wk90;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/mpy<",
            "Ll/by3;",
            "Ll/db5;",
            ">;",
            "Ll/cy3;",
            "Ll/wk90<",
            "Ll/fb5<",
            "Ll/db5;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/em80;->a:Ll/mpy;

    .line 5
    .line 6
    iput-object p2, p0, Ll/em80;->b:Ll/cy3;

    .line 7
    .line 8
    iput-object p3, p0, Ll/em80;->c:Ll/wk90;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public b(Ll/z06;Ll/yk90;)V
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z06<",
            "Ll/fb5<",
            "Ll/db5;",
            ">;>;",
            "Ll/yk90;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-interface {p2}, Ll/yk90;->n()Ll/cl90;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {p2}, Ll/yk90;->t()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-interface {p2}, Ll/yk90;->k()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {v1}, Lcom/facebook/imagepipeline/request/ImageRequest;->m()Ll/fm80;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    if-eqz v3, :cond_0

    .line 18
    .line 19
    invoke-interface {v3}, Ll/fm80;->a()Ll/by3;

    .line 20
    .line 21
    .line 22
    move-result-object v4

    .line 23
    if-nez v4, :cond_1

    .line 24
    .line 25
    :cond_0
    move-object v6, p1

    .line 26
    goto/16 :goto_1

    .line 27
    .line 28
    :cond_1
    invoke-virtual {p0}, Ll/em80;->c()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v4

    .line 32
    invoke-interface {v0, p2, v4}, Ll/cl90;->d(Ll/yk90;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    iget-object v4, p0, Ll/em80;->b:Ll/cy3;

    .line 36
    .line 37
    invoke-interface {v4, v1, v2}, Ll/cy3;->a(Lcom/facebook/imagepipeline/request/ImageRequest;Ljava/lang/Object;)Ll/by3;

    .line 38
    .line 39
    .line 40
    move-result-object v7

    .line 41
    invoke-interface {p2}, Ll/yk90;->t()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    const/4 v2, 0x1

    .line 46
    invoke-virtual {v1, v2}, Lcom/facebook/imagepipeline/request/ImageRequest;->z(I)Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    const/4 v4, 0x0

    .line 51
    if-eqz v1, :cond_2

    .line 52
    .line 53
    iget-object v1, p0, Ll/em80;->a:Ll/mpy;

    .line 54
    .line 55
    invoke-interface {v1, v7}, Ll/mpy;->get(Ljava/lang/Object;)Ll/fb5;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    goto :goto_0

    .line 60
    :cond_2
    move-object v1, v4

    .line 61
    :goto_0
    const-string v11, "cached_value_found"

    .line 62
    .line 63
    if-eqz v1, :cond_4

    .line 64
    .line 65
    invoke-virtual {p0}, Ll/em80;->c()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    invoke-virtual {p0}, Ll/em80;->c()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-interface {v0, p2, p0}, Ll/cl90;->k(Ll/yk90;Ljava/lang/String;)Z

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    if-eqz p0, :cond_3

    .line 78
    .line 79
    const-string p0, "true"

    .line 80
    .line 81
    invoke-static {v11, p0}, Lcom/facebook/common/internal/ImmutableMap;->of(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    .line 82
    .line 83
    .line 84
    move-result-object v4

    .line 85
    :cond_3
    invoke-interface {v0, p2, v3, v4}, Ll/cl90;->f(Ll/yk90;Ljava/lang/String;Ljava/util/Map;)V

    .line 86
    .line 87
    .line 88
    const-string p0, "PostprocessedBitmapMemoryCacheProducer"

    .line 89
    .line 90
    invoke-interface {v0, p2, p0, v2}, Ll/cl90;->e(Ll/yk90;Ljava/lang/String;Z)V

    .line 91
    .line 92
    .line 93
    const-string p0, "memory_bitmap"

    .line 94
    .line 95
    const-string v0, "postprocessed"

    .line 96
    .line 97
    invoke-interface {p2, p0, v0}, Ll/yk90;->u(Ljava/lang/String;Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    const/high16 p0, 0x3f800000    # 1.0f

    .line 101
    .line 102
    invoke-interface {p1, p0}, Ll/z06;->c(F)V

    .line 103
    .line 104
    .line 105
    invoke-interface {p1, v1, v2}, Ll/z06;->b(Ljava/lang/Object;I)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {v1}, Ll/fb5;->close()V

    .line 109
    .line 110
    .line 111
    return-void

    .line 112
    :cond_4
    instance-of v8, v3, Ll/h0d0;

    .line 113
    .line 114
    invoke-interface {p2}, Ll/yk90;->t()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    const/4 v2, 0x2

    .line 119
    invoke-virtual {v1, v2}, Lcom/facebook/imagepipeline/request/ImageRequest;->z(I)Z

    .line 120
    .line 121
    .line 122
    move-result v10

    .line 123
    new-instance v5, Ll/em80$a;

    .line 124
    .line 125
    iget-object v9, p0, Ll/em80;->a:Ll/mpy;

    .line 126
    .line 127
    move-object v6, p1

    .line 128
    invoke-direct/range {v5 .. v10}, Ll/em80$a;-><init>(Ll/z06;Ll/by3;ZLl/mpy;Z)V

    .line 129
    .line 130
    .line 131
    invoke-virtual {p0}, Ll/em80;->c()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    invoke-virtual {p0}, Ll/em80;->c()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    invoke-interface {v0, p2, v1}, Ll/cl90;->k(Ll/yk90;Ljava/lang/String;)Z

    .line 140
    .line 141
    .line 142
    move-result v1

    .line 143
    if-eqz v1, :cond_5

    .line 144
    .line 145
    const-string v1, "false"

    .line 146
    .line 147
    invoke-static {v11, v1}, Lcom/facebook/common/internal/ImmutableMap;->of(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    .line 148
    .line 149
    .line 150
    move-result-object v4

    .line 151
    :cond_5
    invoke-interface {v0, p2, p1, v4}, Ll/cl90;->f(Ll/yk90;Ljava/lang/String;Ljava/util/Map;)V

    .line 152
    .line 153
    .line 154
    iget-object p0, p0, Ll/em80;->c:Ll/wk90;

    .line 155
    .line 156
    invoke-interface {p0, v5, p2}, Ll/wk90;->b(Ll/z06;Ll/yk90;)V

    .line 157
    .line 158
    .line 159
    return-void

    .line 160
    :goto_1
    iget-object p0, p0, Ll/em80;->c:Ll/wk90;

    .line 161
    .line 162
    invoke-interface {p0, v6, p2}, Ll/wk90;->b(Ll/z06;Ll/yk90;)V

    .line 163
    .line 164
    .line 165
    return-void
.end method

.method public c()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "PostprocessedBitmapMemoryCacheProducer"

    .line 2
    .line 3
    return-object p0
.end method
