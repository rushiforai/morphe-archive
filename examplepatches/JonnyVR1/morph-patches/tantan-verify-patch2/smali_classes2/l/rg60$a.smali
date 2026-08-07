.class public Ll/rg60$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/u26;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/rg60;->h(Ll/z06;Ll/yk90;Ll/by3;)Ll/u26;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/u26<",
        "Ll/n0f;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ll/cl90;

.field public final synthetic b:Ll/yk90;

.field public final synthetic c:Ll/z06;

.field public final synthetic d:Ll/by3;

.field public final synthetic e:Ll/rg60;


# direct methods
.method public constructor <init>(Ll/rg60;Ll/cl90;Ll/yk90;Ll/z06;Ll/by3;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/rg60$a;->e:Ll/rg60;

    .line 2
    .line 3
    iput-object p2, p0, Ll/rg60$a;->a:Ll/cl90;

    .line 4
    .line 5
    iput-object p3, p0, Ll/rg60$a;->b:Ll/yk90;

    .line 6
    .line 7
    iput-object p4, p0, Ll/rg60$a;->c:Ll/z06;

    .line 8
    .line 9
    iput-object p5, p0, Ll/rg60$a;->d:Ll/by3;

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/ini0;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Ll/rg60$a;->b(Ll/ini0;)Ljava/lang/Void;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public b(Ll/ini0;)Ljava/lang/Void;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/ini0<",
            "Ll/n0f;",
            ">;)",
            "Ljava/lang/Void;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/rg60;->d(Ll/ini0;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const-string v2, "PartialDiskCacheProducer"

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object p1, p0, Ll/rg60$a;->a:Ll/cl90;

    .line 11
    .line 12
    iget-object v0, p0, Ll/rg60$a;->b:Ll/yk90;

    .line 13
    .line 14
    invoke-interface {p1, v0, v2, v1}, Ll/cl90;->a(Ll/yk90;Ljava/lang/String;Ljava/util/Map;)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Ll/rg60$a;->c:Ll/z06;

    .line 18
    .line 19
    invoke-interface {p0}, Ll/z06;->a()V

    .line 20
    .line 21
    .line 22
    goto/16 :goto_0

    .line 23
    .line 24
    :cond_0
    invoke-virtual {p1}, Ll/ini0;->n()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    iget-object v0, p0, Ll/rg60$a;->a:Ll/cl90;

    .line 31
    .line 32
    iget-object v3, p0, Ll/rg60$a;->b:Ll/yk90;

    .line 33
    .line 34
    invoke-virtual {p1}, Ll/ini0;->i()Ljava/lang/Exception;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-interface {v0, v3, v2, p1, v1}, Ll/cl90;->i(Ll/yk90;Ljava/lang/String;Ljava/lang/Throwable;Ljava/util/Map;)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Ll/rg60$a;->e:Ll/rg60;

    .line 42
    .line 43
    iget-object v0, p0, Ll/rg60$a;->c:Ll/z06;

    .line 44
    .line 45
    iget-object v2, p0, Ll/rg60$a;->b:Ll/yk90;

    .line 46
    .line 47
    iget-object p0, p0, Ll/rg60$a;->d:Ll/by3;

    .line 48
    .line 49
    invoke-static {p1, v0, v2, p0, v1}, Ll/rg60;->c(Ll/rg60;Ll/z06;Ll/yk90;Ll/by3;Ll/n0f;)V

    .line 50
    .line 51
    .line 52
    goto/16 :goto_0

    .line 53
    .line 54
    :cond_1
    invoke-virtual {p1}, Ll/ini0;->j()Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    check-cast p1, Ll/n0f;

    .line 59
    .line 60
    iget-object v0, p0, Ll/rg60$a;->a:Ll/cl90;

    .line 61
    .line 62
    if-eqz p1, :cond_3

    .line 63
    .line 64
    iget-object v3, p0, Ll/rg60$a;->b:Ll/yk90;

    .line 65
    .line 66
    invoke-virtual {p1}, Ll/n0f;->M()I

    .line 67
    .line 68
    .line 69
    move-result v4

    .line 70
    const/4 v5, 0x1

    .line 71
    invoke-static {v0, v3, v5, v4}, Ll/rg60;->f(Ll/cl90;Ll/yk90;ZI)Ljava/util/Map;

    .line 72
    .line 73
    .line 74
    move-result-object v4

    .line 75
    invoke-interface {v0, v3, v2, v4}, Ll/cl90;->f(Ll/yk90;Ljava/lang/String;Ljava/util/Map;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p1}, Ll/n0f;->M()I

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    sub-int/2addr v0, v5

    .line 83
    invoke-static {v0}, Ll/vr3;->d(I)Ll/vr3;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-virtual {p1, v0}, Ll/n0f;->k0(Ll/vr3;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p1}, Ll/n0f;->M()I

    .line 91
    .line 92
    .line 93
    move-result v3

    .line 94
    iget-object v4, p0, Ll/rg60$a;->b:Ll/yk90;

    .line 95
    .line 96
    invoke-interface {v4}, Ll/yk90;->t()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 97
    .line 98
    .line 99
    move-result-object v4

    .line 100
    invoke-virtual {v4}, Lcom/facebook/imagepipeline/request/ImageRequest;->c()Ll/vr3;

    .line 101
    .line 102
    .line 103
    move-result-object v6

    .line 104
    invoke-virtual {v0, v6}, Ll/vr3;->b(Ll/vr3;)Z

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    if-eqz v0, :cond_2

    .line 109
    .line 110
    iget-object v0, p0, Ll/rg60$a;->b:Ll/yk90;

    .line 111
    .line 112
    const-string v3, "disk"

    .line 113
    .line 114
    const-string v4, "partial"

    .line 115
    .line 116
    invoke-interface {v0, v3, v4}, Ll/yk90;->u(Ljava/lang/String;Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    iget-object v0, p0, Ll/rg60$a;->a:Ll/cl90;

    .line 120
    .line 121
    iget-object v3, p0, Ll/rg60$a;->b:Ll/yk90;

    .line 122
    .line 123
    invoke-interface {v0, v3, v2, v5}, Ll/cl90;->e(Ll/yk90;Ljava/lang/String;Z)V

    .line 124
    .line 125
    .line 126
    iget-object p0, p0, Ll/rg60$a;->c:Ll/z06;

    .line 127
    .line 128
    const/16 v0, 0x9

    .line 129
    .line 130
    invoke-interface {p0, p1, v0}, Ll/z06;->b(Ljava/lang/Object;I)V

    .line 131
    .line 132
    .line 133
    goto :goto_0

    .line 134
    :cond_2
    iget-object v0, p0, Ll/rg60$a;->c:Ll/z06;

    .line 135
    .line 136
    const/16 v2, 0x8

    .line 137
    .line 138
    invoke-interface {v0, p1, v2}, Ll/z06;->b(Ljava/lang/Object;I)V

    .line 139
    .line 140
    .line 141
    invoke-static {v4}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->b(Lcom/facebook/imagepipeline/request/ImageRequest;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    sub-int/2addr v3, v5

    .line 146
    invoke-static {v3}, Ll/vr3;->c(I)Ll/vr3;

    .line 147
    .line 148
    .line 149
    move-result-object v2

    .line 150
    invoke-virtual {v0, v2}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->A(Ll/vr3;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    invoke-virtual {v0}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->a()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    new-instance v2, Ll/eve0;

    .line 159
    .line 160
    iget-object v3, p0, Ll/rg60$a;->b:Ll/yk90;

    .line 161
    .line 162
    invoke-direct {v2, v0, v3}, Ll/eve0;-><init>(Lcom/facebook/imagepipeline/request/ImageRequest;Ll/yk90;)V

    .line 163
    .line 164
    .line 165
    iget-object v0, p0, Ll/rg60$a;->e:Ll/rg60;

    .line 166
    .line 167
    iget-object v3, p0, Ll/rg60$a;->c:Ll/z06;

    .line 168
    .line 169
    iget-object p0, p0, Ll/rg60$a;->d:Ll/by3;

    .line 170
    .line 171
    invoke-static {v0, v3, v2, p0, p1}, Ll/rg60;->c(Ll/rg60;Ll/z06;Ll/yk90;Ll/by3;Ll/n0f;)V

    .line 172
    .line 173
    .line 174
    goto :goto_0

    .line 175
    :cond_3
    iget-object v3, p0, Ll/rg60$a;->b:Ll/yk90;

    .line 176
    .line 177
    const/4 v4, 0x0

    .line 178
    invoke-static {v0, v3, v4, v4}, Ll/rg60;->f(Ll/cl90;Ll/yk90;ZI)Ljava/util/Map;

    .line 179
    .line 180
    .line 181
    move-result-object v4

    .line 182
    invoke-interface {v0, v3, v2, v4}, Ll/cl90;->f(Ll/yk90;Ljava/lang/String;Ljava/util/Map;)V

    .line 183
    .line 184
    .line 185
    iget-object v0, p0, Ll/rg60$a;->e:Ll/rg60;

    .line 186
    .line 187
    iget-object v2, p0, Ll/rg60$a;->c:Ll/z06;

    .line 188
    .line 189
    iget-object v3, p0, Ll/rg60$a;->b:Ll/yk90;

    .line 190
    .line 191
    iget-object p0, p0, Ll/rg60$a;->d:Ll/by3;

    .line 192
    .line 193
    invoke-static {v0, v2, v3, p0, p1}, Ll/rg60;->c(Ll/rg60;Ll/z06;Ll/yk90;Ll/by3;Ll/n0f;)V

    .line 194
    .line 195
    .line 196
    :goto_0
    return-object v1
.end method
