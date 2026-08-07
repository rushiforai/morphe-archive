.class Ll/h410$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/q210$d;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/h410;->f(Lcom/momo/pub/MomoPipelineModuleRegister$c;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/momo/pub/MomoPipelineModuleRegister$c;

.field final synthetic b:Ll/h410;


# direct methods
.method public constructor <init>(Ll/h410;Lcom/momo/pub/MomoPipelineModuleRegister$c;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/h410$d;->b:Ll/h410;

    .line 2
    .line 3
    iput-object p2, p0, Ll/h410$d;->a:Lcom/momo/pub/MomoPipelineModuleRegister$c;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public d0(Ljava/lang/Object;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/h410$d;->b:Ll/h410;

    .line 2
    .line 3
    invoke-static {v0}, Ll/h410;->R(Ll/h410;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    iget-object v1, p0, Ll/h410$d;->b:Ll/h410;

    .line 9
    .line 10
    invoke-static {v1}, Ll/h410;->R(Ll/h410;)Ljava/util/List;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-eqz v2, :cond_1

    .line 23
    .line 24
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    check-cast v2, Ll/fr2;

    .line 29
    .line 30
    invoke-virtual {v2}, Ll/fr2;->s2()Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    if-ne v3, p1, :cond_0

    .line 35
    .line 36
    iget-object v3, p0, Ll/h410$d;->a:Lcom/momo/pub/MomoPipelineModuleRegister$c;

    .line 37
    .line 38
    invoke-interface {v3, v2}, Lcom/momo/pub/MomoPipelineModuleRegister$c;->b(Ll/c4m;)V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :catchall_0
    move-exception p0

    .line 43
    goto :goto_1

    .line 44
    :cond_1
    monitor-exit v0

    .line 45
    return-void

    .line 46
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 47
    throw p0
.end method

.method public j0(Ljava/lang/Object;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/h410$d;->b:Ll/h410;

    .line 2
    .line 3
    invoke-static {v0}, Ll/h410;->R(Ll/h410;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    iget-object v1, p0, Ll/h410$d;->b:Ll/h410;

    .line 9
    .line 10
    invoke-static {v1}, Ll/h410;->R(Ll/h410;)Ljava/util/List;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-eqz v2, :cond_1

    .line 23
    .line 24
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    check-cast v2, Ll/fr2;

    .line 29
    .line 30
    invoke-virtual {v2}, Ll/fr2;->s2()Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    if-ne v3, p1, :cond_0

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :catchall_0
    move-exception p0

    .line 38
    goto :goto_1

    .line 39
    :cond_1
    const/4 v2, 0x0

    .line 40
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 41
    const/4 v0, 0x0

    .line 42
    if-eqz v2, :cond_3

    .line 43
    .line 44
    invoke-virtual {v2}, Ll/fr2;->u2()Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-eqz p1, :cond_2

    .line 49
    .line 50
    invoke-virtual {v2, v0}, Ll/fr2;->y2(Z)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_2
    iget-object p0, p0, Ll/h410$d;->a:Lcom/momo/pub/MomoPipelineModuleRegister$c;

    .line 55
    .line 56
    invoke-interface {p0, v2}, Lcom/momo/pub/MomoPipelineModuleRegister$c;->a(Ll/c4m;)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_3
    iget-object v1, p0, Ll/h410$d;->b:Ll/h410;

    .line 61
    .line 62
    invoke-static {v1}, Ll/h410;->S(Ll/h410;)Ll/c410;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    if-eqz v1, :cond_4

    .line 67
    .line 68
    iget-object v1, p0, Ll/h410$d;->b:Ll/h410;

    .line 69
    .line 70
    invoke-static {v1}, Ll/h410;->S(Ll/h410;)Ll/c410;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-interface {v1}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->A0()Ll/q210$a;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    if-eqz v1, :cond_4

    .line 79
    .line 80
    iget-object p0, p0, Ll/h410$d;->b:Ll/h410;

    .line 81
    .line 82
    invoke-static {p0}, Ll/h410;->S(Ll/h410;)Ll/c410;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-interface {p0}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->A0()Ll/q210$a;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    const/16 v1, 0x4002

    .line 91
    .line 92
    invoke-interface {p0, v1, v0, v0, p1}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 93
    .line 94
    .line 95
    :cond_4
    return-void

    .line 96
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 97
    throw p0
.end method
