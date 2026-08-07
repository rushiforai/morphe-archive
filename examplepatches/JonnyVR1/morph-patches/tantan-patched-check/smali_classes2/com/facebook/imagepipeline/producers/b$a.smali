.class public Lcom/facebook/imagepipeline/producers/b$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/u26;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/imagepipeline/producers/b;->h(Ll/z06;Ll/yk90;)Ll/u26;
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

.field public final synthetic d:Lcom/facebook/imagepipeline/producers/b;


# direct methods
.method public constructor <init>(Lcom/facebook/imagepipeline/producers/b;Ll/cl90;Ll/yk90;Ll/z06;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/facebook/imagepipeline/producers/b$a;->d:Lcom/facebook/imagepipeline/producers/b;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/facebook/imagepipeline/producers/b$a;->a:Ll/cl90;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/facebook/imagepipeline/producers/b$a;->b:Ll/yk90;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/facebook/imagepipeline/producers/b$a;->c:Ll/z06;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
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
    invoke-virtual {p0, p1}, Lcom/facebook/imagepipeline/producers/b$a;->b(Ll/ini0;)Ljava/lang/Void;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public b(Ll/ini0;)Ljava/lang/Void;
    .locals 6
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
    invoke-static {p1}, Lcom/facebook/imagepipeline/producers/b;->d(Ll/ini0;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const-string v2, "DiskCacheProducer"

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object p1, p0, Lcom/facebook/imagepipeline/producers/b$a;->a:Ll/cl90;

    .line 11
    .line 12
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/b$a;->b:Ll/yk90;

    .line 13
    .line 14
    invoke-interface {p1, v0, v2, v1}, Ll/cl90;->a(Ll/yk90;Ljava/lang/String;Ljava/util/Map;)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/facebook/imagepipeline/producers/b$a;->c:Ll/z06;

    .line 18
    .line 19
    invoke-interface {p0}, Ll/z06;->a()V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    invoke-virtual {p1}, Ll/ini0;->n()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/b$a;->a:Ll/cl90;

    .line 30
    .line 31
    iget-object v3, p0, Lcom/facebook/imagepipeline/producers/b$a;->b:Ll/yk90;

    .line 32
    .line 33
    invoke-virtual {p1}, Ll/ini0;->i()Ljava/lang/Exception;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-interface {v0, v3, v2, p1, v1}, Ll/cl90;->i(Ll/yk90;Ljava/lang/String;Ljava/lang/Throwable;Ljava/util/Map;)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Lcom/facebook/imagepipeline/producers/b$a;->d:Lcom/facebook/imagepipeline/producers/b;

    .line 41
    .line 42
    invoke-static {p1}, Lcom/facebook/imagepipeline/producers/b;->c(Lcom/facebook/imagepipeline/producers/b;)Ll/wk90;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/b$a;->c:Ll/z06;

    .line 47
    .line 48
    iget-object p0, p0, Lcom/facebook/imagepipeline/producers/b$a;->b:Ll/yk90;

    .line 49
    .line 50
    invoke-interface {p1, v0, p0}, Ll/wk90;->b(Ll/z06;Ll/yk90;)V

    .line 51
    .line 52
    .line 53
    goto :goto_0

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
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/b$a;->a:Ll/cl90;

    .line 61
    .line 62
    if-eqz p1, :cond_2

    .line 63
    .line 64
    iget-object v3, p0, Lcom/facebook/imagepipeline/producers/b$a;->b:Ll/yk90;

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
    invoke-static {v0, v3, v5, v4}, Lcom/facebook/imagepipeline/producers/b;->e(Ll/cl90;Ll/yk90;ZI)Ljava/util/Map;

    .line 72
    .line 73
    .line 74
    move-result-object v4

    .line 75
    invoke-interface {v0, v3, v2, v4}, Ll/cl90;->f(Ll/yk90;Ljava/lang/String;Ljava/util/Map;)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/b$a;->a:Ll/cl90;

    .line 79
    .line 80
    iget-object v3, p0, Lcom/facebook/imagepipeline/producers/b$a;->b:Ll/yk90;

    .line 81
    .line 82
    invoke-interface {v0, v3, v2, v5}, Ll/cl90;->e(Ll/yk90;Ljava/lang/String;Z)V

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/b$a;->b:Ll/yk90;

    .line 86
    .line 87
    const-string v2, "disk"

    .line 88
    .line 89
    invoke-interface {v0, v2}, Ll/yk90;->B(Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/b$a;->c:Ll/z06;

    .line 93
    .line 94
    const/high16 v2, 0x3f800000    # 1.0f

    .line 95
    .line 96
    invoke-interface {v0, v2}, Ll/z06;->c(F)V

    .line 97
    .line 98
    .line 99
    iget-object p0, p0, Lcom/facebook/imagepipeline/producers/b$a;->c:Ll/z06;

    .line 100
    .line 101
    invoke-interface {p0, p1, v5}, Ll/z06;->b(Ljava/lang/Object;I)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {p1}, Ll/n0f;->close()V

    .line 105
    .line 106
    .line 107
    goto :goto_0

    .line 108
    :cond_2
    iget-object p1, p0, Lcom/facebook/imagepipeline/producers/b$a;->b:Ll/yk90;

    .line 109
    .line 110
    const/4 v3, 0x0

    .line 111
    invoke-static {v0, p1, v3, v3}, Lcom/facebook/imagepipeline/producers/b;->e(Ll/cl90;Ll/yk90;ZI)Ljava/util/Map;

    .line 112
    .line 113
    .line 114
    move-result-object v3

    .line 115
    invoke-interface {v0, p1, v2, v3}, Ll/cl90;->f(Ll/yk90;Ljava/lang/String;Ljava/util/Map;)V

    .line 116
    .line 117
    .line 118
    iget-object p1, p0, Lcom/facebook/imagepipeline/producers/b$a;->d:Lcom/facebook/imagepipeline/producers/b;

    .line 119
    .line 120
    invoke-static {p1}, Lcom/facebook/imagepipeline/producers/b;->c(Lcom/facebook/imagepipeline/producers/b;)Ll/wk90;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/b$a;->c:Ll/z06;

    .line 125
    .line 126
    iget-object p0, p0, Lcom/facebook/imagepipeline/producers/b$a;->b:Ll/yk90;

    .line 127
    .line 128
    invoke-interface {p1, v0, p0}, Ll/wk90;->b(Ll/z06;Ll/yk90;)V

    .line 129
    .line 130
    .line 131
    :goto_0
    return-object v1
.end method
