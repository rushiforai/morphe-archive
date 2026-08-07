.class Ll/h410$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/q210$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/h410;->A(Lcom/momo/pub/MomoPipelineModuleRegister$b;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/momo/pub/MomoPipelineModuleRegister$b;

.field final synthetic b:Ll/h410;


# direct methods
.method public constructor <init>(Ll/h410;Lcom/momo/pub/MomoPipelineModuleRegister$b;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/h410$a;->b:Ll/h410;

    .line 2
    .line 3
    iput-object p2, p0, Ll/h410$a;->a:Lcom/momo/pub/MomoPipelineModuleRegister$b;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public declared-synchronized a(IILjava/lang/Object;)V
    .locals 6

    .line 1
    monitor-enter p0

    .line 2
    const/16 v0, 0x300e

    .line 3
    .line 4
    if-ne p1, v0, :cond_1

    .line 5
    .line 6
    :try_start_0
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Ll/csx;->f0()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    const-string p1, "lqdebug"

    .line 17
    .line 18
    const-string v0, "MOMO_VIDEO_DYNAMIC_SCALING changeMomoPushSizeEx"

    .line 19
    .line 20
    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Ll/h410$a;->b:Ll/h410;

    .line 24
    .line 25
    invoke-static {p1}, Ll/h410;->a(Ll/h410;)Ll/ror;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p1, v0}, Ll/h410;->T(Ll/uow;)V

    .line 30
    .line 31
    .line 32
    const/16 p1, 0x2005

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :catchall_0
    move-exception p1

    .line 36
    goto :goto_4

    .line 37
    :cond_0
    iget-object v0, p0, Ll/h410$a;->b:Ll/h410;

    .line 38
    .line 39
    invoke-static {v0}, Ll/h410;->Q(Ll/h410;)Ll/h410$e;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    if-eqz v0, :cond_1

    .line 44
    .line 45
    const-string v0, "lqdebug"

    .line 46
    .line 47
    const-string v1, "MOMO_VIDEO_DYNAMIC_SCALING onPushSizeChange"

    .line 48
    .line 49
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Ll/h410$a;->b:Ll/h410;

    .line 53
    .line 54
    invoke-static {v0}, Ll/h410;->Q(Ll/h410;)Ll/h410$e;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    iget-object v1, p0, Ll/h410$a;->b:Ll/h410;

    .line 59
    .line 60
    invoke-static {v1}, Ll/h410;->a(Ll/h410;)Ll/ror;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-interface {v0, v1}, Ll/h410$e;->a(Ll/ror;)V

    .line 65
    .line 66
    .line 67
    :cond_1
    :goto_0
    iget-object v0, p0, Ll/h410$a;->b:Ll/h410;

    .line 68
    .line 69
    invoke-static {v0}, Ll/h410;->R(Ll/h410;)Ljava/util/List;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    monitor-enter v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 74
    :try_start_1
    iget-object v1, p0, Ll/h410$a;->b:Ll/h410;

    .line 75
    .line 76
    invoke-static {v1}, Ll/h410;->R(Ll/h410;)Ljava/util/List;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    const/4 v2, 0x1

    .line 85
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 86
    .line 87
    .line 88
    move-result v3

    .line 89
    const/4 v4, 0x0

    .line 90
    if-eqz v3, :cond_4

    .line 91
    .line 92
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    check-cast v2, Ll/fr2;

    .line 97
    .line 98
    invoke-virtual {v2}, Ll/fr2;->s2()Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 99
    .line 100
    .line 101
    move-result-object v3

    .line 102
    if-ne v3, p3, :cond_2

    .line 103
    .line 104
    iget-object v3, p0, Ll/h410$a;->a:Lcom/momo/pub/MomoPipelineModuleRegister$b;

    .line 105
    .line 106
    invoke-interface {v3, p1, p2, v2}, Lcom/momo/pub/MomoPipelineModuleRegister$b;->a(IILl/c4m;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 107
    .line 108
    .line 109
    goto :goto_2

    .line 110
    :catchall_1
    move-exception p1

    .line 111
    goto :goto_3

    .line 112
    :cond_2
    iget-object v3, p0, Ll/h410$a;->a:Lcom/momo/pub/MomoPipelineModuleRegister$b;

    .line 113
    .line 114
    const v5, 0x8002

    .line 115
    .line 116
    .line 117
    if-ne p1, v5, :cond_3

    .line 118
    .line 119
    :try_start_2
    invoke-interface {v3, p1, p2, v2}, Lcom/momo/pub/MomoPipelineModuleRegister$b;->a(IILl/c4m;)V

    .line 120
    .line 121
    .line 122
    goto :goto_2

    .line 123
    :cond_3
    invoke-interface {v3, p1, p2, v4}, Lcom/momo/pub/MomoPipelineModuleRegister$b;->a(IILl/c4m;)V

    .line 124
    .line 125
    .line 126
    :goto_2
    const/4 v2, 0x0

    .line 127
    goto :goto_1

    .line 128
    :cond_4
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 129
    if-eqz v2, :cond_5

    .line 130
    .line 131
    :try_start_3
    iget-object p3, p0, Ll/h410$a;->a:Lcom/momo/pub/MomoPipelineModuleRegister$b;

    .line 132
    .line 133
    invoke-interface {p3, p1, p2, v4}, Lcom/momo/pub/MomoPipelineModuleRegister$b;->a(IILl/c4m;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 134
    .line 135
    .line 136
    :cond_5
    monitor-exit p0

    .line 137
    return-void

    .line 138
    :goto_3
    :try_start_4
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 139
    :try_start_5
    throw p1

    .line 140
    :goto_4
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 141
    throw p1
.end method
