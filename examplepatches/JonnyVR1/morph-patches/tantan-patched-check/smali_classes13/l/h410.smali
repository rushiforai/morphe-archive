.class public Ll/h410;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/pub/MomoPipelineModuleRegister;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/h410$e;
    }
.end annotation


# instance fields
.field private final a:Ljava/lang/String;

.field private b:Ll/c410;

.field private c:Ll/ror;

.field private d:Ll/suf;

.field private e:Ll/rsy;

.field private f:Z

.field private g:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field

.field private h:I

.field private i:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/fr2;",
            ">;"
        }
    .end annotation
.end field

.field j:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap<",
            "Ljava/lang/String;",
            "Ll/n5m;",
            ">;"
        }
    .end annotation
.end field

.field k:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap<",
            "Ljava/lang/String;",
            "Ll/cql;",
            ">;"
        }
    .end annotation
.end field

.field l:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap<",
            "Ljava/lang/String;",
            "Ll/lvl;",
            ">;"
        }
    .end annotation
.end field

.field m:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap<",
            "Ljava/lang/String;",
            "Ll/mvl;",
            ">;"
        }
    .end annotation
.end field

.field private n:Ll/usl;

.field private o:Ll/pvl;

.field private p:Ll/epl;

.field q:Ll/dpl;

.field r:Ll/q210$c;

.field s:Ll/q210$b;

.field t:Ll/q210$d;

.field u:Lcom/momo/piplinemomoext/input/audio/a;

.field private v:Ll/h410$e;


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .locals 1
    .param p1    # Landroid/app/Activity;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "Pipeline_Normal_pip->PIPLINE"

    .line 5
    .line 6
    iput-object v0, p0, Ll/h410;->a:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput v0, p0, Ll/h410;->h:I

    .line 10
    .line 11
    new-instance v0, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 12
    .line 13
    invoke-direct {v0}, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/h410;->j:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 17
    .line 18
    new-instance v0, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 19
    .line 20
    invoke-direct {v0}, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/h410;->k:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 24
    .line 25
    new-instance v0, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 26
    .line 27
    invoke-direct {v0}, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Ll/h410;->l:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 31
    .line 32
    new-instance v0, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 33
    .line 34
    invoke-direct {v0}, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Ll/h410;->m:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 38
    .line 39
    invoke-static {p1}, Ll/wti0;->c(Landroid/app/Activity;)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    iput v0, p0, Ll/h410;->h:I

    .line 44
    .line 45
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 46
    .line 47
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    iput-object v0, p0, Ll/h410;->g:Ljava/lang/ref/WeakReference;

    .line 55
    .line 56
    new-instance p1, Ljava/util/ArrayList;

    .line 57
    .line 58
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 59
    .line 60
    .line 61
    iput-object p1, p0, Ll/h410;->i:Ljava/util/List;

    .line 62
    .line 63
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    const-string v0, "Pipeline_Normal_pip->PIPLINE"

    iput-object v0, p0, Ll/h410;->a:Ljava/lang/String;

    const/4 v0, 0x0

    .line 66
    iput v0, p0, Ll/h410;->h:I

    .line 67
    new-instance v0, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    invoke-direct {v0}, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;-><init>()V

    iput-object v0, p0, Ll/h410;->j:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 68
    new-instance v0, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    invoke-direct {v0}, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;-><init>()V

    iput-object v0, p0, Ll/h410;->k:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 69
    new-instance v0, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    invoke-direct {v0}, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;-><init>()V

    iput-object v0, p0, Ll/h410;->l:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 70
    new-instance v0, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    invoke-direct {v0}, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;-><init>()V

    iput-object v0, p0, Ll/h410;->m:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 71
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Ll/h410;->g:Ljava/lang/ref/WeakReference;

    .line 72
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Ll/h410;->i:Ljava/util/List;

    return-void
.end method

.method public static synthetic Q(Ll/h410;)Ll/h410$e;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/h410;->v:Ll/h410$e;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic R(Ll/h410;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/h410;->i:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic S(Ll/h410;)Ll/c410;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/h410;->b:Ll/c410;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic a(Ll/h410;)Ll/ror;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/h410;->c:Ll/ror;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public A(Lcom/momo/pub/MomoPipelineModuleRegister$b;)V
    .locals 4

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "Pipeline_Normal_pip->PIPLINE"

    .line 6
    .line 7
    new-instance v2, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v3, "setOnInfoListener"

    .line 10
    .line 11
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v0, v1, v2}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/h410;->b:Ll/c410;

    .line 25
    .line 26
    if-eqz v0, :cond_3

    .line 27
    .line 28
    iget-object v1, p0, Ll/h410;->r:Ll/q210$c;

    .line 29
    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    invoke-interface {v0, v1}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->o0(Ll/q210$c;)V

    .line 33
    .line 34
    .line 35
    const/4 v0, 0x0

    .line 36
    iput-object v0, p0, Ll/h410;->r:Ll/q210$c;

    .line 37
    .line 38
    :cond_0
    if-nez p1, :cond_1

    .line 39
    .line 40
    goto :goto_2

    .line 41
    :cond_1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    const-string v1, "Pipeline_Normal_pip->PIPLINE"

    .line 46
    .line 47
    const-string v2, "setOnInfoListener success"

    .line 48
    .line 49
    invoke-virtual {v0, v1, v2}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Ll/h410;->i:Ljava/util/List;

    .line 53
    .line 54
    monitor-enter v0

    .line 55
    :try_start_0
    iget-object v1, p0, Ll/h410;->i:Ljava/util/List;

    .line 56
    .line 57
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    if-eqz v2, :cond_2

    .line 66
    .line 67
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    check-cast v2, Ll/fr2;

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :catchall_0
    move-exception p0

    .line 75
    goto :goto_1

    .line 76
    :cond_2
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 77
    new-instance v0, Ll/h410$a;

    .line 78
    .line 79
    invoke-direct {v0, p0, p1}, Ll/h410$a;-><init>(Ll/h410;Lcom/momo/pub/MomoPipelineModuleRegister$b;)V

    .line 80
    .line 81
    .line 82
    iput-object v0, p0, Ll/h410;->r:Ll/q210$c;

    .line 83
    .line 84
    iget-object p1, p0, Ll/h410;->b:Ll/c410;

    .line 85
    .line 86
    new-instance v0, Ll/h410$b;

    .line 87
    .line 88
    invoke-direct {v0, p0}, Ll/h410$b;-><init>(Ll/h410;)V

    .line 89
    .line 90
    .line 91
    invoke-interface {p1, v0}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->W(Ll/o410$f;)V

    .line 92
    .line 93
    .line 94
    iget-object p1, p0, Ll/h410;->b:Ll/c410;

    .line 95
    .line 96
    iget-object p0, p0, Ll/h410;->r:Ll/q210$c;

    .line 97
    .line 98
    invoke-interface {p1, p0}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->h0(Ll/q210$c;)V

    .line 99
    .line 100
    .line 101
    return-void

    .line 102
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 103
    throw p0

    .line 104
    :cond_3
    :goto_2
    return-void
.end method

.method public B(Ll/pvl;)V
    .locals 3
    .param p1    # Ll/pvl;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/h410;->b:Ll/c410;

    .line 2
    .line 3
    if-eqz v0, :cond_6

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    goto/16 :goto_1

    .line 8
    .line 9
    :cond_0
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string v2, "unregisterInput Name:"

    .line 16
    .line 17
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v2, " class:"

    .line 32
    .line 33
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    const-string v2, "Pipeline_Normal_pip->PIPLINE"

    .line 44
    .line 45
    invoke-virtual {v0, v2, v1}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    instance-of v0, p1, Ll/cql;

    .line 49
    .line 50
    const/4 v1, 0x0

    .line 51
    if-eqz v0, :cond_1

    .line 52
    .line 53
    iget-object v0, p0, Ll/h410;->k:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 54
    .line 55
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    invoke-virtual {v0, v2}, Ljava/util/AbstractMap;->containsKey(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-eqz v0, :cond_5

    .line 64
    .line 65
    iget-object v0, p0, Ll/h410;->k:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 66
    .line 67
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    invoke-virtual {v0, v2}, Ljava/util/AbstractMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_1
    instance-of v0, p1, Ll/mvl;

    .line 76
    .line 77
    if-eqz v0, :cond_2

    .line 78
    .line 79
    iget-object v0, p0, Ll/h410;->m:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 80
    .line 81
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    invoke-virtual {v0, v2}, Ljava/util/AbstractMap;->containsKey(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    if-eqz v0, :cond_5

    .line 90
    .line 91
    iget-object v0, p0, Ll/h410;->m:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 92
    .line 93
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    invoke-virtual {v0, v2}, Ljava/util/AbstractMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    goto :goto_0

    .line 101
    :cond_2
    instance-of v0, p1, Ll/lvl;

    .line 102
    .line 103
    if-eqz v0, :cond_3

    .line 104
    .line 105
    iget-object v0, p0, Ll/h410;->l:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 106
    .line 107
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v2

    .line 111
    invoke-virtual {v0, v2}, Ljava/util/AbstractMap;->containsKey(Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    if-eqz v0, :cond_5

    .line 116
    .line 117
    iget-object v0, p0, Ll/h410;->l:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 118
    .line 119
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v2

    .line 123
    invoke-virtual {v0, v2}, Ljava/util/AbstractMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    goto :goto_0

    .line 127
    :cond_3
    instance-of v0, p1, Ll/n5m;

    .line 128
    .line 129
    if-eqz v0, :cond_4

    .line 130
    .line 131
    iget-object v0, p0, Ll/h410;->j:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 132
    .line 133
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object v2

    .line 137
    invoke-virtual {v0, v2}, Ljava/util/AbstractMap;->containsKey(Ljava/lang/Object;)Z

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    if-eqz v0, :cond_5

    .line 142
    .line 143
    iget-object v0, p0, Ll/h410;->j:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 144
    .line 145
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object v2

    .line 149
    invoke-virtual {v0, v2}, Ljava/util/AbstractMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 150
    .line 151
    .line 152
    goto :goto_0

    .line 153
    :cond_4
    iget-object v0, p0, Ll/h410;->n:Ll/usl;

    .line 154
    .line 155
    if-ne p1, v0, :cond_5

    .line 156
    .line 157
    iput-object v1, p0, Ll/h410;->n:Ll/usl;

    .line 158
    .line 159
    :cond_5
    :goto_0
    iget-object v0, p0, Ll/h410;->o:Ll/pvl;

    .line 160
    .line 161
    if-ne p1, v0, :cond_6

    .line 162
    .line 163
    iput-object v1, p0, Ll/h410;->o:Ll/pvl;

    .line 164
    .line 165
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 166
    .line 167
    .line 168
    move-result-object p1

    .line 169
    new-instance v0, Ljava/lang/StringBuilder;

    .line 170
    .line 171
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 172
    .line 173
    .line 174
    iget-object v1, p0, Ll/h410;->k:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 175
    .line 176
    invoke-virtual {v1}, Ljava/util/AbstractMap;->size()I

    .line 177
    .line 178
    .line 179
    move-result v1

    .line 180
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 181
    .line 182
    .line 183
    const-string v1, "<>"

    .line 184
    .line 185
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    iget-object v2, p0, Ll/h410;->m:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 189
    .line 190
    invoke-virtual {v2}, Ljava/util/AbstractMap;->size()I

    .line 191
    .line 192
    .line 193
    move-result v2

    .line 194
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 195
    .line 196
    .line 197
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 198
    .line 199
    .line 200
    iget-object v2, p0, Ll/h410;->l:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 201
    .line 202
    invoke-virtual {v2}, Ljava/util/AbstractMap;->size()I

    .line 203
    .line 204
    .line 205
    move-result v2

    .line 206
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 207
    .line 208
    .line 209
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 210
    .line 211
    .line 212
    iget-object v1, p0, Ll/h410;->j:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 213
    .line 214
    invoke-virtual {v1}, Ljava/util/AbstractMap;->size()I

    .line 215
    .line 216
    .line 217
    move-result v1

    .line 218
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 219
    .line 220
    .line 221
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 222
    .line 223
    .line 224
    move-result-object v0

    .line 225
    const-string v1, "llc"

    .line 226
    .line 227
    invoke-virtual {p1, v1, v0}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 228
    .line 229
    .line 230
    iget-object p1, p0, Ll/h410;->k:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 231
    .line 232
    invoke-virtual {p1}, Ljava/util/AbstractMap;->size()I

    .line 233
    .line 234
    .line 235
    move-result p1

    .line 236
    if-gtz p1, :cond_6

    .line 237
    .line 238
    iget-object p1, p0, Ll/h410;->m:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 239
    .line 240
    invoke-virtual {p1}, Ljava/util/AbstractMap;->size()I

    .line 241
    .line 242
    .line 243
    move-result p1

    .line 244
    if-gtz p1, :cond_6

    .line 245
    .line 246
    iget-object p1, p0, Ll/h410;->l:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 247
    .line 248
    invoke-virtual {p1}, Ljava/util/AbstractMap;->size()I

    .line 249
    .line 250
    .line 251
    move-result p1

    .line 252
    if-gtz p1, :cond_6

    .line 253
    .line 254
    iget-object p0, p0, Ll/h410;->j:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 255
    .line 256
    invoke-virtual {p0}, Ljava/util/AbstractMap;->size()I

    .line 257
    .line 258
    .line 259
    :cond_6
    :goto_1
    return-void
.end method

.method public declared-synchronized C(Ll/c4m;)V
    .locals 4

    .line 1
    const-string v0, "unregisterPusher"

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/h410;->b:Ll/c410;

    .line 5
    .line 6
    if-eqz v1, :cond_1

    .line 7
    .line 8
    iget-object v1, p0, Ll/h410;->i:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    const-string v2, "Pipeline_Normal_pip->PIPLINE"

    .line 22
    .line 23
    new-instance v3, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v1, v2, v0}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Ll/h410;->i:Ljava/util/List;

    .line 39
    .line 40
    monitor-enter v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 41
    :try_start_1
    iget-object v1, p0, Ll/h410;->i:Ljava/util/List;

    .line 42
    .line 43
    invoke-interface {v1, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 47
    monitor-exit p0

    .line 48
    return-void

    .line 49
    :catchall_0
    move-exception p1

    .line 50
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 51
    :try_start_3
    throw p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 52
    :catchall_1
    move-exception p1

    .line 53
    goto :goto_1

    .line 54
    :cond_1
    :goto_0
    monitor-exit p0

    .line 55
    return-void

    .line 56
    :goto_1
    :try_start_4
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 57
    throw p1
.end method

.method public D(Ll/j410$b;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/h410;->b:Ll/c410;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->D(Ll/j410$b;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public E(Ll/row;Ll/jt2;)Ll/cql;
    .locals 9
    .param p1    # Ll/row;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ll/jt2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/h410;->b:Ll/c410;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "Pipeline_Normal_pip->PIPLINE"

    .line 12
    .line 13
    new-instance v2, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string v3, "registerCameraInput Height:"

    .line 16
    .line 17
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1}, Ll/row;->f()Ll/erf0;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    invoke-virtual {v3}, Ll/erf0;->a()I

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v3, " Width:"

    .line 32
    .line 33
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1}, Ll/row;->f()Ll/erf0;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    invoke-virtual {v3}, Ll/erf0;->b()I

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-virtual {v0, v1, v2}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    new-instance v3, Ll/w94;

    .line 55
    .line 56
    iget-object v4, p0, Ll/h410;->c:Ll/ror;

    .line 57
    .line 58
    iget-object v5, p0, Ll/h410;->b:Ll/c410;

    .line 59
    .line 60
    iget v7, p0, Ll/h410;->h:I

    .line 61
    .line 62
    move-object v6, p1

    .line 63
    move-object v8, p2

    .line 64
    invoke-direct/range {v3 .. v8}, Ll/w94;-><init>(Ll/uow;Lcom/momo/pipline/MomoInterface/MomoPipeline;Ll/row;ILl/jt2;)V

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Ll/h410;->k:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 68
    .line 69
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p2

    .line 73
    invoke-virtual {p1, p2, v3}, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    iget-object p1, p0, Ll/h410;->o:Ll/pvl;

    .line 77
    .line 78
    if-nez p1, :cond_3

    .line 79
    .line 80
    iput-object v3, p0, Ll/h410;->o:Ll/pvl;

    .line 81
    .line 82
    iget-object p1, p0, Ll/h410;->b:Ll/c410;

    .line 83
    .line 84
    invoke-interface {p1}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->r0()Z

    .line 85
    .line 86
    .line 87
    move-result p1

    .line 88
    if-eqz p1, :cond_3

    .line 89
    .line 90
    iget-object p1, p0, Ll/h410;->e:Ll/rsy;

    .line 91
    .line 92
    if-eqz p1, :cond_1

    .line 93
    .line 94
    invoke-virtual {p1}, Ll/rsy;->X1()V

    .line 95
    .line 96
    .line 97
    :cond_1
    iget-object p1, p0, Ll/h410;->i:Ljava/util/List;

    .line 98
    .line 99
    monitor-enter p1

    .line 100
    :try_start_0
    iget-object p2, p0, Ll/h410;->i:Ljava/util/List;

    .line 101
    .line 102
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 103
    .line 104
    .line 105
    move-result-object p2

    .line 106
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    if-eqz v0, :cond_2

    .line 111
    .line 112
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    check-cast v0, Ll/fr2;

    .line 117
    .line 118
    iget-object v1, p0, Ll/h410;->o:Ll/pvl;

    .line 119
    .line 120
    invoke-interface {v1}, Ll/pvl;->a()Ll/z5m;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    invoke-virtual {v0, v1}, Ll/fr2;->r2(Ll/z5m;)V

    .line 125
    .line 126
    .line 127
    goto :goto_0

    .line 128
    :catchall_0
    move-exception v0

    .line 129
    move-object p0, v0

    .line 130
    goto :goto_1

    .line 131
    :cond_2
    monitor-exit p1

    .line 132
    return-object v3

    .line 133
    :goto_1
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 134
    throw p0

    .line 135
    :cond_3
    return-object v3
.end method

.method public F()Lcom/momo/pipline/MomoInterface/MomoPipeline;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/h410;->b:Ll/c410;

    .line 2
    .line 3
    return-object p0
.end method

.method public G(Ll/drl;)Ll/fa5;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/h410;->b:Ll/c410;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p1}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->U(Ll/drl;)V

    .line 6
    .line 7
    .line 8
    new-instance p1, Ll/fa5;

    .line 9
    .line 10
    iget-object p0, p0, Ll/h410;->b:Ll/c410;

    .line 11
    .line 12
    invoke-direct {p1, p0}, Ll/fa5;-><init>(Ll/c410;)V

    .line 13
    .line 14
    .line 15
    return-object p1

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return-object p0
.end method

.method public H(Ll/suf;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/h410;->d:Ll/suf;

    .line 2
    .line 3
    iget-object p0, p0, Ll/h410;->b:Ll/c410;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->H(Ll/suf;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public I(Ll/wej;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/h410;->b:Ll/c410;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->I(Ll/wej;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public J(Ll/dpl;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object p0, p0, Ll/h410;->b:Ll/c410;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->C0(Ll/dpl;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-interface {p1}, Ll/dpl;->I1()V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_1
    iget-object p1, p0, Ll/h410;->p:Ll/epl;

    .line 15
    .line 16
    if-nez p1, :cond_2

    .line 17
    .line 18
    new-instance p1, Ll/ib1;

    .line 19
    .line 20
    iget-object v0, p0, Ll/h410;->b:Ll/c410;

    .line 21
    .line 22
    invoke-direct {p1, v0}, Ll/ib1;-><init>(Lcom/momo/pipline/MomoInterface/MomoPipeline;)V

    .line 23
    .line 24
    .line 25
    iput-object p1, p0, Ll/h410;->p:Ll/epl;

    .line 26
    .line 27
    :cond_2
    iget-object p1, p0, Ll/h410;->p:Ll/epl;

    .line 28
    .line 29
    invoke-interface {p1}, Ll/epl;->b()Ll/dpl;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    if-eqz p1, :cond_3

    .line 34
    .line 35
    iget-object p1, p0, Ll/h410;->p:Ll/epl;

    .line 36
    .line 37
    invoke-interface {p1}, Ll/epl;->stopAudio()V

    .line 38
    .line 39
    .line 40
    :cond_3
    iget-object p1, p0, Ll/h410;->p:Ll/epl;

    .line 41
    .line 42
    iget-object v0, p0, Ll/h410;->c:Ll/ror;

    .line 43
    .line 44
    iget-object v1, p0, Ll/h410;->b:Ll/c410;

    .line 45
    .line 46
    invoke-interface {v1}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->A0()Ll/q210$a;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-static {v0, v1}, Ll/f410;->a(Ll/uow;Ll/q210$a;)Ll/dpl;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-interface {p1, v0}, Ll/epl;->c(Ll/dpl;)V

    .line 55
    .line 56
    .line 57
    iget-object p1, p0, Ll/h410;->b:Ll/c410;

    .line 58
    .line 59
    if-eqz p1, :cond_4

    .line 60
    .line 61
    iget-object v0, p0, Ll/h410;->p:Ll/epl;

    .line 62
    .line 63
    invoke-interface {v0}, Ll/epl;->b()Ll/dpl;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-interface {p1, v0}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->C0(Ll/dpl;)V

    .line 68
    .line 69
    .line 70
    :cond_4
    iget-object p0, p0, Ll/h410;->p:Ll/epl;

    .line 71
    .line 72
    invoke-interface {p0}, Ll/epl;->a()V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public K()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/h410;->c:Ll/ror;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "startConfRegister mParameters is null"

    .line 10
    .line 11
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object v0, p0, Ll/h410;->b:Ll/c410;

    .line 19
    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Ll/h410;->c:Ll/ror;

    .line 23
    .line 24
    invoke-static {v0}, Ll/d410;->o(Ll/uow;)Ll/c410;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iput-object v0, p0, Ll/h410;->b:Ll/c410;

    .line 29
    .line 30
    :cond_1
    iget-object v0, p0, Ll/h410;->d:Ll/suf;

    .line 31
    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    iget-object v1, p0, Ll/h410;->b:Ll/c410;

    .line 35
    .line 36
    invoke-interface {v1, v0}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->H(Ll/suf;)V

    .line 37
    .line 38
    .line 39
    :cond_2
    iget-object v0, p0, Ll/h410;->e:Ll/rsy;

    .line 40
    .line 41
    if-eqz v0, :cond_3

    .line 42
    .line 43
    iget-object v1, p0, Ll/h410;->b:Ll/c410;

    .line 44
    .line 45
    invoke-interface {v1, v0}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->t0(Ll/rsy;)V

    .line 46
    .line 47
    .line 48
    :cond_3
    invoke-virtual {p0}, Ll/h410;->l()Lcom/momo/piplinemomoext/input/audio/a;

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public L()Ll/usl;
    .locals 3

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "Pipeline_Normal_pip->PIPLINE"

    .line 6
    .line 7
    const-string v2, "registerEmptyInput "

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    new-instance v0, Ll/wze;

    .line 13
    .line 14
    iget-object v1, p0, Ll/h410;->c:Ll/ror;

    .line 15
    .line 16
    iget-object v2, p0, Ll/h410;->b:Ll/c410;

    .line 17
    .line 18
    invoke-direct {v0, v1, v2}, Ll/wze;-><init>(Ll/uow;Lcom/momo/pipline/MomoInterface/MomoPipeline;)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Ll/h410;->n:Ll/usl;

    .line 22
    .line 23
    iget-object v1, p0, Ll/h410;->o:Ll/pvl;

    .line 24
    .line 25
    if-nez v1, :cond_0

    .line 26
    .line 27
    iput-object v0, p0, Ll/h410;->o:Ll/pvl;

    .line 28
    .line 29
    :cond_0
    return-object v0
.end method

.method public declared-synchronized M(Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;Ljava/lang/String;Ll/brx;)Ll/hwl;
    .locals 7

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/h410;->o:Ll/pvl;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    monitor-exit p0

    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    :try_start_1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "Pipeline_Normal_pip->PIPLINE"

    .line 14
    .line 15
    const-string v2, "registerLinkMicPusher"

    .line 16
    .line 17
    invoke-virtual {v0, v1, v2}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    if-eqz p3, :cond_2

    .line 21
    .line 22
    invoke-static {}, Ll/arx;->d()Ll/arx;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {p3}, Ll/brx;->b()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v0, v1}, Ll/arx;->h(Ljava/lang/String;)Ll/arx$d;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    iget-object v1, v0, Ll/arx$d;->e:Ll/bsx;

    .line 37
    .line 38
    if-eqz v1, :cond_1

    .line 39
    .line 40
    invoke-static {}, Ll/vnk0;->a()Ll/vnk0;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    iget-object v0, v0, Ll/arx$d;->e:Ll/bsx;

    .line 45
    .line 46
    invoke-virtual {v1, v0}, Ll/vnk0;->e(Ll/bsx;)V

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :catchall_0
    move-exception v0

    .line 51
    move-object p1, v0

    .line 52
    goto/16 :goto_3

    .line 53
    .line 54
    :cond_1
    :goto_0
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    const-string v1, "registerLinkMicPusher1 updateMediaConfigsForIJKByMediaConfig "

    .line 59
    .line 60
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-virtual {v0, v1}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 65
    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_2
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    const-string v1, "registerLinkMicPusher1 mediaCfgParams appid is null"

    .line 73
    .line 74
    invoke-virtual {p3}, Ll/brx;->m()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    filled-new-array {v1, v2}, [Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    invoke-virtual {v0, v1}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 83
    .line 84
    .line 85
    :goto_1
    sget-object v0, Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;->AGORALINK:Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;

    .line 86
    .line 87
    if-ne p1, v0, :cond_4

    .line 88
    .line 89
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    if-eqz p1, :cond_3

    .line 94
    .line 95
    new-instance v0, Ll/uc0;

    .line 96
    .line 97
    invoke-virtual {p0}, Ll/h410;->U()Landroid/content/Context;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    iget-object v2, p0, Ll/h410;->b:Ll/c410;

    .line 102
    .line 103
    iget-object p1, p0, Ll/h410;->o:Ll/pvl;

    .line 104
    .line 105
    invoke-interface {p1}, Ll/pvl;->a()Ll/z5m;

    .line 106
    .line 107
    .line 108
    move-result-object v3

    .line 109
    iget-object v4, p0, Ll/h410;->c:Ll/ror;

    .line 110
    .line 111
    iget-object v5, p0, Ll/h410;->u:Lcom/momo/piplinemomoext/input/audio/a;

    .line 112
    .line 113
    invoke-direct/range {v0 .. v5}, Ll/uc0;-><init>(Landroid/content/Context;Ll/c410;Ll/z5m;Ll/uow;Lcom/momo/piplinemomoext/input/audio/a;)V

    .line 114
    .line 115
    .line 116
    goto/16 :goto_2

    .line 117
    .line 118
    :cond_3
    new-instance v0, Ll/uc0;

    .line 119
    .line 120
    invoke-virtual {p0}, Ll/h410;->U()Landroid/content/Context;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    iget-object v2, p0, Ll/h410;->b:Ll/c410;

    .line 125
    .line 126
    iget-object p1, p0, Ll/h410;->o:Ll/pvl;

    .line 127
    .line 128
    invoke-interface {p1}, Ll/pvl;->a()Ll/z5m;

    .line 129
    .line 130
    .line 131
    move-result-object v3

    .line 132
    iget-object v4, p0, Ll/h410;->c:Ll/ror;

    .line 133
    .line 134
    iget-object v5, p0, Ll/h410;->u:Lcom/momo/piplinemomoext/input/audio/a;

    .line 135
    .line 136
    move-object v6, p2

    .line 137
    invoke-direct/range {v0 .. v6}, Ll/uc0;-><init>(Landroid/content/Context;Ll/c410;Ll/z5m;Ll/uow;Lcom/momo/piplinemomoext/input/audio/a;Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    goto/16 :goto_2

    .line 141
    .line 142
    :cond_4
    move-object v6, p2

    .line 143
    sget-object p2, Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;->WEILALINK:Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;

    .line 144
    .line 145
    if-ne p1, p2, :cond_6

    .line 146
    .line 147
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 148
    .line 149
    .line 150
    move-result p1

    .line 151
    if-eqz p1, :cond_5

    .line 152
    .line 153
    new-instance v0, Ll/rwp0;

    .line 154
    .line 155
    invoke-virtual {p0}, Ll/h410;->U()Landroid/content/Context;

    .line 156
    .line 157
    .line 158
    move-result-object v1

    .line 159
    iget-object v2, p0, Ll/h410;->b:Ll/c410;

    .line 160
    .line 161
    iget-object p1, p0, Ll/h410;->o:Ll/pvl;

    .line 162
    .line 163
    invoke-interface {p1}, Ll/pvl;->a()Ll/z5m;

    .line 164
    .line 165
    .line 166
    move-result-object v3

    .line 167
    iget-object v4, p0, Ll/h410;->c:Ll/ror;

    .line 168
    .line 169
    iget-object v5, p0, Ll/h410;->u:Lcom/momo/piplinemomoext/input/audio/a;

    .line 170
    .line 171
    invoke-direct/range {v0 .. v5}, Ll/rwp0;-><init>(Landroid/content/Context;Ll/c410;Ll/z5m;Ll/uow;Lcom/momo/piplinemomoext/input/audio/a;)V

    .line 172
    .line 173
    .line 174
    goto/16 :goto_2

    .line 175
    .line 176
    :cond_5
    new-instance v0, Ll/rwp0;

    .line 177
    .line 178
    invoke-virtual {p0}, Ll/h410;->U()Landroid/content/Context;

    .line 179
    .line 180
    .line 181
    move-result-object v1

    .line 182
    iget-object v2, p0, Ll/h410;->b:Ll/c410;

    .line 183
    .line 184
    iget-object p1, p0, Ll/h410;->o:Ll/pvl;

    .line 185
    .line 186
    invoke-interface {p1}, Ll/pvl;->a()Ll/z5m;

    .line 187
    .line 188
    .line 189
    move-result-object v3

    .line 190
    iget-object v4, p0, Ll/h410;->c:Ll/ror;

    .line 191
    .line 192
    iget-object v5, p0, Ll/h410;->u:Lcom/momo/piplinemomoext/input/audio/a;

    .line 193
    .line 194
    invoke-direct/range {v0 .. v6}, Ll/rwp0;-><init>(Landroid/content/Context;Ll/c410;Ll/z5m;Ll/uow;Lcom/momo/piplinemomoext/input/audio/a;Ljava/lang/String;)V

    .line 195
    .line 196
    .line 197
    goto/16 :goto_2

    .line 198
    .line 199
    :cond_6
    sget-object p2, Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;->MOMORTCLINK:Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;

    .line 200
    .line 201
    if-ne p1, p2, :cond_8

    .line 202
    .line 203
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 204
    .line 205
    .line 206
    move-result p1

    .line 207
    if-eqz p1, :cond_7

    .line 208
    .line 209
    new-instance v0, Ll/ce00;

    .line 210
    .line 211
    invoke-virtual {p0}, Ll/h410;->U()Landroid/content/Context;

    .line 212
    .line 213
    .line 214
    move-result-object v1

    .line 215
    iget-object v2, p0, Ll/h410;->b:Ll/c410;

    .line 216
    .line 217
    iget-object p1, p0, Ll/h410;->o:Ll/pvl;

    .line 218
    .line 219
    invoke-interface {p1}, Ll/pvl;->a()Ll/z5m;

    .line 220
    .line 221
    .line 222
    move-result-object v3

    .line 223
    iget-object v4, p0, Ll/h410;->c:Ll/ror;

    .line 224
    .line 225
    iget-object v5, p0, Ll/h410;->u:Lcom/momo/piplinemomoext/input/audio/a;

    .line 226
    .line 227
    invoke-direct/range {v0 .. v5}, Ll/ce00;-><init>(Landroid/content/Context;Ll/c410;Ll/z5m;Ll/uow;Lcom/momo/piplinemomoext/input/audio/a;)V

    .line 228
    .line 229
    .line 230
    goto/16 :goto_2

    .line 231
    .line 232
    :cond_7
    new-instance v0, Ll/ce00;

    .line 233
    .line 234
    invoke-virtual {p0}, Ll/h410;->U()Landroid/content/Context;

    .line 235
    .line 236
    .line 237
    move-result-object v1

    .line 238
    iget-object v2, p0, Ll/h410;->b:Ll/c410;

    .line 239
    .line 240
    iget-object p1, p0, Ll/h410;->o:Ll/pvl;

    .line 241
    .line 242
    invoke-interface {p1}, Ll/pvl;->a()Ll/z5m;

    .line 243
    .line 244
    .line 245
    move-result-object v3

    .line 246
    iget-object v4, p0, Ll/h410;->c:Ll/ror;

    .line 247
    .line 248
    iget-object v5, p0, Ll/h410;->u:Lcom/momo/piplinemomoext/input/audio/a;

    .line 249
    .line 250
    invoke-direct/range {v0 .. v6}, Ll/ce00;-><init>(Landroid/content/Context;Ll/c410;Ll/z5m;Ll/uow;Lcom/momo/piplinemomoext/input/audio/a;Ljava/lang/String;)V

    .line 251
    .line 252
    .line 253
    goto :goto_2

    .line 254
    :cond_8
    sget-object p2, Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;->VOLCLINK:Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;

    .line 255
    .line 256
    if-ne p1, p2, :cond_a

    .line 257
    .line 258
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 259
    .line 260
    .line 261
    move-result p1

    .line 262
    if-eqz p1, :cond_9

    .line 263
    .line 264
    new-instance v0, Ll/ymp0;

    .line 265
    .line 266
    invoke-virtual {p0}, Ll/h410;->U()Landroid/content/Context;

    .line 267
    .line 268
    .line 269
    move-result-object v1

    .line 270
    iget-object v2, p0, Ll/h410;->b:Ll/c410;

    .line 271
    .line 272
    iget-object p1, p0, Ll/h410;->o:Ll/pvl;

    .line 273
    .line 274
    invoke-interface {p1}, Ll/pvl;->a()Ll/z5m;

    .line 275
    .line 276
    .line 277
    move-result-object v3

    .line 278
    iget-object v4, p0, Ll/h410;->c:Ll/ror;

    .line 279
    .line 280
    iget-object v5, p0, Ll/h410;->u:Lcom/momo/piplinemomoext/input/audio/a;

    .line 281
    .line 282
    invoke-direct/range {v0 .. v5}, Ll/ymp0;-><init>(Landroid/content/Context;Ll/c410;Ll/z5m;Ll/uow;Lcom/momo/piplinemomoext/input/audio/a;)V

    .line 283
    .line 284
    .line 285
    goto :goto_2

    .line 286
    :cond_9
    new-instance v0, Ll/ymp0;

    .line 287
    .line 288
    invoke-virtual {p0}, Ll/h410;->U()Landroid/content/Context;

    .line 289
    .line 290
    .line 291
    move-result-object v1

    .line 292
    iget-object v2, p0, Ll/h410;->b:Ll/c410;

    .line 293
    .line 294
    iget-object p1, p0, Ll/h410;->o:Ll/pvl;

    .line 295
    .line 296
    invoke-interface {p1}, Ll/pvl;->a()Ll/z5m;

    .line 297
    .line 298
    .line 299
    move-result-object v3

    .line 300
    iget-object v4, p0, Ll/h410;->c:Ll/ror;

    .line 301
    .line 302
    iget-object v5, p0, Ll/h410;->u:Lcom/momo/piplinemomoext/input/audio/a;

    .line 303
    .line 304
    invoke-direct/range {v0 .. v6}, Ll/ymp0;-><init>(Landroid/content/Context;Ll/c410;Ll/z5m;Ll/uow;Lcom/momo/piplinemomoext/input/audio/a;Ljava/lang/String;)V

    .line 305
    .line 306
    .line 307
    goto :goto_2

    .line 308
    :cond_a
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 309
    .line 310
    .line 311
    move-result p1

    .line 312
    if-eqz p1, :cond_b

    .line 313
    .line 314
    new-instance v0, Ll/xmj0;

    .line 315
    .line 316
    invoke-virtual {p0}, Ll/h410;->U()Landroid/content/Context;

    .line 317
    .line 318
    .line 319
    move-result-object v1

    .line 320
    iget-object v2, p0, Ll/h410;->b:Ll/c410;

    .line 321
    .line 322
    iget-object p1, p0, Ll/h410;->o:Ll/pvl;

    .line 323
    .line 324
    invoke-interface {p1}, Ll/pvl;->a()Ll/z5m;

    .line 325
    .line 326
    .line 327
    move-result-object v3

    .line 328
    iget-object v4, p0, Ll/h410;->c:Ll/ror;

    .line 329
    .line 330
    iget-object v5, p0, Ll/h410;->u:Lcom/momo/piplinemomoext/input/audio/a;

    .line 331
    .line 332
    invoke-direct/range {v0 .. v5}, Ll/xmj0;-><init>(Landroid/content/Context;Ll/c410;Ll/z5m;Ll/uow;Lcom/momo/piplinemomoext/input/audio/a;)V

    .line 333
    .line 334
    .line 335
    goto :goto_2

    .line 336
    :cond_b
    new-instance v0, Ll/xmj0;

    .line 337
    .line 338
    invoke-virtual {p0}, Ll/h410;->U()Landroid/content/Context;

    .line 339
    .line 340
    .line 341
    move-result-object v1

    .line 342
    iget-object v2, p0, Ll/h410;->b:Ll/c410;

    .line 343
    .line 344
    iget-object p1, p0, Ll/h410;->o:Ll/pvl;

    .line 345
    .line 346
    invoke-interface {p1}, Ll/pvl;->a()Ll/z5m;

    .line 347
    .line 348
    .line 349
    move-result-object v3

    .line 350
    iget-object v4, p0, Ll/h410;->c:Ll/ror;

    .line 351
    .line 352
    iget-object v5, p0, Ll/h410;->u:Lcom/momo/piplinemomoext/input/audio/a;

    .line 353
    .line 354
    invoke-direct/range {v0 .. v6}, Ll/xmj0;-><init>(Landroid/content/Context;Ll/c410;Ll/z5m;Ll/uow;Lcom/momo/piplinemomoext/input/audio/a;Ljava/lang/String;)V

    .line 355
    .line 356
    .line 357
    :goto_2
    invoke-virtual {v0, p3}, Ll/fr2;->x2(Ll/brx;)V

    .line 358
    .line 359
    .line 360
    invoke-virtual {v0}, Ll/fr2;->m2()Ll/dpl;

    .line 361
    .line 362
    .line 363
    move-result-object p1

    .line 364
    iput-object p1, p0, Ll/h410;->q:Ll/dpl;

    .line 365
    .line 366
    iget-object p1, p0, Ll/h410;->p:Ll/epl;

    .line 367
    .line 368
    if-eqz p1, :cond_c

    .line 369
    .line 370
    invoke-virtual {v0}, Ll/fr2;->m2()Ll/dpl;

    .line 371
    .line 372
    .line 373
    move-result-object p2

    .line 374
    invoke-interface {p1, p2}, Ll/epl;->c(Ll/dpl;)V

    .line 375
    .line 376
    .line 377
    :cond_c
    iget-object p1, p0, Ll/h410;->i:Ljava/util/List;

    .line 378
    .line 379
    monitor-enter p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 380
    :try_start_2
    iget-object p2, p0, Ll/h410;->i:Ljava/util/List;

    .line 381
    .line 382
    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 383
    .line 384
    .line 385
    monitor-exit p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 386
    monitor-exit p0

    .line 387
    return-object v0

    .line 388
    :catchall_1
    move-exception v0

    .line 389
    move-object p2, v0

    .line 390
    :try_start_3
    monitor-exit p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 391
    :try_start_4
    throw p2

    .line 392
    :goto_3
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 393
    throw p1
.end method

.method public N()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/h410;->c:Ll/ror;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 12
    .line 13
    .line 14
    iget-object v2, p0, Ll/h410;->c:Ll/ror;

    .line 15
    .line 16
    iget v2, v2, Ll/tow;->u:I

    .line 17
    .line 18
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v2, "<>"

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    iget-object v2, p0, Ll/h410;->c:Ll/ror;

    .line 27
    .line 28
    iget v2, v2, Ll/tow;->v:I

    .line 29
    .line 30
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    const-string v2, "llc"

    .line 38
    .line 39
    invoke-virtual {v0, v2, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Ll/h410;->e:Ll/rsy;

    .line 43
    .line 44
    iget-object p0, p0, Ll/h410;->c:Ll/ror;

    .line 45
    .line 46
    iget v1, p0, Ll/tow;->u:I

    .line 47
    .line 48
    iget p0, p0, Ll/tow;->v:I

    .line 49
    .line 50
    invoke-virtual {v0, v1, p0}, Ll/rsy;->setRenderSize(II)V

    .line 51
    .line 52
    .line 53
    :cond_0
    return-void
.end method

.method public O(Z)V
    .locals 3

    .line 1
    iput-boolean p1, p0, Ll/h410;->f:Z

    .line 2
    .line 3
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v2, "setLandMode, width:"

    .line 10
    .line 11
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object v2, p0, Ll/h410;->c:Ll/ror;

    .line 15
    .line 16
    iget v2, v2, Ll/tow;->u:I

    .line 17
    .line 18
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v2, ", height:"

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    iget-object v2, p0, Ll/h410;->c:Ll/ror;

    .line 27
    .line 28
    iget v2, v2, Ll/tow;->v:I

    .line 29
    .line 30
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v2, ", IsLandMode:"

    .line 34
    .line 35
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-boolean v2, p0, Ll/h410;->f:Z

    .line 39
    .line 40
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    const-string v2, "Pipeline_Normal_pip->PIPLINE"

    .line 48
    .line 49
    invoke-virtual {v0, v2, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Ll/h410;->e:Ll/rsy;

    .line 53
    .line 54
    if-eqz v0, :cond_0

    .line 55
    .line 56
    iget-object v1, p0, Ll/h410;->b:Ll/c410;

    .line 57
    .line 58
    iget-object p0, p0, Ll/h410;->c:Ll/ror;

    .line 59
    .line 60
    invoke-virtual {v0, p1, v1, p0}, Ll/rsy;->a2(ZLcom/momo/pipline/MomoInterface/MomoPipeline;Ll/uow;)V

    .line 61
    .line 62
    .line 63
    :cond_0
    return-void
.end method

.method public declared-synchronized P(Ll/brx;)Ll/zzl;
    .locals 8

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/h410;->o:Ll/pvl;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    monitor-exit p0

    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    :try_start_1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "Pipeline_Normal_pip->PIPLINE"

    .line 14
    .line 15
    const-string v2, "registerMomoPusher"

    .line 16
    .line 17
    invoke-virtual {v0, v1, v2}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    if-eqz p1, :cond_2

    .line 21
    .line 22
    invoke-static {}, Ll/arx;->d()Ll/arx;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {p1}, Ll/brx;->b()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v0, v1}, Ll/arx;->h(Ljava/lang/String;)Ll/arx$d;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    iget-object v1, v0, Ll/arx$d;->e:Ll/bsx;

    .line 37
    .line 38
    if-eqz v1, :cond_1

    .line 39
    .line 40
    invoke-static {}, Ll/vnk0;->a()Ll/vnk0;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    iget-object v0, v0, Ll/arx$d;->e:Ll/bsx;

    .line 45
    .line 46
    invoke-virtual {v1, v0}, Ll/vnk0;->e(Ll/bsx;)V

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :catchall_0
    move-exception v0

    .line 51
    move-object p1, v0

    .line 52
    goto/16 :goto_4

    .line 53
    .line 54
    :cond_1
    :goto_0
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    const-string v1, "registerMomoPusher updateMediaConfigsForIJKByMediaConfig "

    .line 59
    .line 60
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-virtual {v0, v1}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 65
    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_2
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    const-string v1, "registerMomoPusher mediaCfgParams appid is null"

    .line 73
    .line 74
    invoke-virtual {p1}, Ll/brx;->m()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    filled-new-array {v1, v2}, [Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    invoke-virtual {v0, v1}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 83
    .line 84
    .line 85
    :goto_1
    new-instance v2, Ll/t410;

    .line 86
    .line 87
    invoke-virtual {p0}, Ll/h410;->U()Landroid/content/Context;

    .line 88
    .line 89
    .line 90
    move-result-object v3

    .line 91
    iget-object v4, p0, Ll/h410;->b:Ll/c410;

    .line 92
    .line 93
    iget-object v0, p0, Ll/h410;->o:Ll/pvl;

    .line 94
    .line 95
    invoke-interface {v0}, Ll/pvl;->a()Ll/z5m;

    .line 96
    .line 97
    .line 98
    move-result-object v5

    .line 99
    iget-object v6, p0, Ll/h410;->c:Ll/ror;

    .line 100
    .line 101
    iget-object v7, p0, Ll/h410;->u:Lcom/momo/piplinemomoext/input/audio/a;

    .line 102
    .line 103
    invoke-direct/range {v2 .. v7}, Ll/t410;-><init>(Landroid/content/Context;Ll/c410;Ll/z5m;Ll/uow;Lcom/momo/piplinemomoext/input/audio/a;)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {v2, p1}, Ll/fr2;->x2(Ll/brx;)V

    .line 107
    .line 108
    .line 109
    iget-object p1, p0, Ll/h410;->i:Ljava/util/List;

    .line 110
    .line 111
    monitor-enter p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 112
    :try_start_2
    iget-object v0, p0, Ll/h410;->i:Ljava/util/List;

    .line 113
    .line 114
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    :cond_3
    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 119
    .line 120
    .line 121
    move-result v1

    .line 122
    if-eqz v1, :cond_4

    .line 123
    .line 124
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    move-result-object v1

    .line 128
    check-cast v1, Ll/c4m;

    .line 129
    .line 130
    instance-of v3, v1, Ll/hwl;

    .line 131
    .line 132
    if-eqz v3, :cond_3

    .line 133
    .line 134
    invoke-interface {v1}, Ll/c4m;->m2()Ll/dpl;

    .line 135
    .line 136
    .line 137
    move-result-object v1

    .line 138
    invoke-virtual {v2, v1}, Ll/t410;->B2(Ll/dpl;)V

    .line 139
    .line 140
    .line 141
    goto :goto_2

    .line 142
    :catchall_1
    move-exception v0

    .line 143
    goto :goto_3

    .line 144
    :cond_4
    invoke-static {}, Ll/f410;->f()Ll/dpl;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    if-eqz v0, :cond_5

    .line 149
    .line 150
    invoke-static {}, Ll/f410;->f()Ll/dpl;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    invoke-interface {v0}, Ll/dpl;->F()Z

    .line 155
    .line 156
    .line 157
    move-result v0

    .line 158
    if-eqz v0, :cond_5

    .line 159
    .line 160
    invoke-static {}, Ll/f410;->f()Ll/dpl;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    invoke-virtual {v2, v0}, Ll/t410;->B2(Ll/dpl;)V

    .line 165
    .line 166
    .line 167
    :cond_5
    iget-object v0, p0, Ll/h410;->i:Ljava/util/List;

    .line 168
    .line 169
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 170
    .line 171
    .line 172
    monitor-exit p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 173
    monitor-exit p0

    .line 174
    return-object v2

    .line 175
    :goto_3
    :try_start_3
    monitor-exit p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 176
    :try_start_4
    throw v0

    .line 177
    :goto_4
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 178
    throw p1
.end method

.method public T(Ll/uow;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/h410;->b:Ll/c410;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget p1, p1, Ll/tow;->H:I

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/c410;->e(I)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public U()Landroid/content/Context;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/h410;->g:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object p0, Ll/l26;->a:Landroid/content/Context;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    sget-object p0, Ll/l26;->a:Landroid/content/Context;

    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_1
    iget-object p0, p0, Ll/h410;->g:Ljava/lang/ref/WeakReference;

    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Landroid/content/Context;

    .line 24
    .line 25
    return-object p0
.end method

.method public V(Ll/pvl;Ljava/lang/String;IIII)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/h410;->b:Ll/c410;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-interface {p1}, Ll/pvl;->a()Ll/z5m;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    const-string v2, "mergeInput"

    .line 20
    .line 21
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-interface {p1}, Ll/pvl;->a()Ll/z5m;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string v2, " class:"

    .line 40
    .line 41
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    const-string v2, " key:"

    .line 48
    .line 49
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    const-string v2, "sourceWidth:"

    .line 56
    .line 57
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string p3, " sourceHeight:"

    .line 64
    .line 65
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    const-string p3, " renderWidth:"

    .line 72
    .line 73
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v1, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    const-string p3, " renderHeight:"

    .line 80
    .line 81
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {v1, p6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p3

    .line 91
    const-string p4, "Pipeline_Normal_pip->PIPLINE"

    .line 92
    .line 93
    invoke-virtual {v0, p4, p3}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    iget-object p3, p0, Ll/h410;->e:Ll/rsy;

    .line 97
    .line 98
    invoke-interface {p1}, Ll/pvl;->a()Ll/z5m;

    .line 99
    .line 100
    .line 101
    move-result-object p4

    .line 102
    invoke-interface {p4}, Ll/z5m;->getInput()Ll/gfj;

    .line 103
    .line 104
    .line 105
    move-result-object p4

    .line 106
    iget-object p0, p0, Ll/h410;->b:Ll/c410;

    .line 107
    .line 108
    invoke-interface {p1}, Ll/pvl;->a()Ll/z5m;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    invoke-interface {p0, p1}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->Z(Ll/z5m;)Ll/g510;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    invoke-virtual {p3, p4, p2, p0}, Ll/rsy;->R1(Ll/gfj;Ljava/lang/String;Ll/g510;)V

    .line 117
    .line 118
    .line 119
    :cond_0
    return-void

    .line 120
    :cond_1
    new-instance p0, Ljava/security/InvalidParameterException;

    .line 121
    .line 122
    const-string p1, "Must startRegister first"

    .line 123
    .line 124
    invoke-direct {p0, p1}, Ljava/security/InvalidParameterException;-><init>(Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    throw p0
.end method

.method public declared-synchronized W()Ll/epl;
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    const-string v1, "Pipeline_Normal_pip->PIPLINE"

    .line 7
    .line 8
    const-string v2, "registerAudioInput"

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/h410;->p:Ll/epl;

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    new-instance v0, Ll/ib1;

    .line 18
    .line 19
    iget-object v1, p0, Ll/h410;->b:Ll/c410;

    .line 20
    .line 21
    invoke-direct {v0, v1}, Ll/ib1;-><init>(Lcom/momo/pipline/MomoInterface/MomoPipeline;)V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Ll/h410;->p:Ll/epl;

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :catchall_0
    move-exception v0

    .line 28
    goto :goto_1

    .line 29
    :cond_0
    :goto_0
    iget-object v0, p0, Ll/h410;->p:Ll/epl;

    .line 30
    .line 31
    invoke-interface {v0}, Ll/epl;->b()Ll/dpl;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    iget-object v0, p0, Ll/h410;->p:Ll/epl;

    .line 38
    .line 39
    invoke-interface {v0}, Ll/epl;->stopAudio()V

    .line 40
    .line 41
    .line 42
    :cond_1
    iget-object v0, p0, Ll/h410;->p:Ll/epl;

    .line 43
    .line 44
    iget-object v1, p0, Ll/h410;->c:Ll/ror;

    .line 45
    .line 46
    iget-object v2, p0, Ll/h410;->b:Ll/c410;

    .line 47
    .line 48
    invoke-interface {v2}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->A0()Ll/q210$a;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-static {v1, v2}, Ll/f410;->a(Ll/uow;Ll/q210$a;)Ll/dpl;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-interface {v0, v1}, Ll/epl;->c(Ll/dpl;)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Ll/h410;->p:Ll/epl;

    .line 60
    .line 61
    invoke-interface {v0}, Ll/epl;->a()V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Ll/h410;->p:Ll/epl;

    .line 65
    .line 66
    invoke-interface {v0}, Ll/epl;->b()Ll/dpl;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    iput-object v0, p0, Ll/h410;->q:Ll/dpl;

    .line 71
    .line 72
    iget-object v0, p0, Ll/h410;->p:Ll/epl;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 73
    .line 74
    monitor-exit p0

    .line 75
    return-object v0

    .line 76
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 77
    throw v0
.end method

.method public X()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/h410;->g:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->clear()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public b(Ll/uow;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/h410;->b:Ll/c410;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/c410;->b(Ll/uow;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public c(Ll/uow;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/h410;->b:Ll/c410;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/c410;->c(Ll/uow;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public d(Ll/ror;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/h410;->b:Ll/c410;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->j0()Ll/g510;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/h410;->b:Ll/c410;

    .line 12
    .line 13
    invoke-interface {v0}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->j0()Ll/g510;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget v1, p1, Ll/tow;->u:I

    .line 18
    .line 19
    iget v2, p1, Ll/tow;->v:I

    .line 20
    .line 21
    invoke-virtual {v0, v1, v2}, Ll/g510;->P(II)V

    .line 22
    .line 23
    .line 24
    :cond_0
    iget-object p0, p0, Ll/h410;->e:Ll/rsy;

    .line 25
    .line 26
    if-eqz p0, :cond_1

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Ll/rsy;->U1(Ll/uow;)V

    .line 29
    .line 30
    .line 31
    :cond_1
    return-void
.end method

.method public e(Lcom/momo/pub/MomoPipelineModuleRegister$a;)V
    .locals 4

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v2, "setOnErrorListener"

    .line 8
    .line 9
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const-string v2, "Pipeline_Normal_pip->PIPLINE"

    .line 20
    .line 21
    invoke-virtual {v0, v2, v1}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/h410;->b:Ll/c410;

    .line 25
    .line 26
    if-eqz v0, :cond_2

    .line 27
    .line 28
    iget-object v1, p0, Ll/h410;->s:Ll/q210$b;

    .line 29
    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    invoke-interface {v0, v1}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->y0(Ll/q210$b;)V

    .line 33
    .line 34
    .line 35
    const/4 v0, 0x0

    .line 36
    iput-object v0, p0, Ll/h410;->s:Ll/q210$b;

    .line 37
    .line 38
    :cond_0
    if-nez p1, :cond_1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    new-instance v1, Ljava/lang/StringBuilder;

    .line 46
    .line 47
    const-string v3, "setOnErrorListener success"

    .line 48
    .line 49
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v0, v2, v1}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    new-instance v0, Ll/h410$c;

    .line 63
    .line 64
    invoke-direct {v0, p0, p1}, Ll/h410$c;-><init>(Ll/h410;Lcom/momo/pub/MomoPipelineModuleRegister$a;)V

    .line 65
    .line 66
    .line 67
    iput-object v0, p0, Ll/h410;->s:Ll/q210$b;

    .line 68
    .line 69
    iget-object p0, p0, Ll/h410;->b:Ll/c410;

    .line 70
    .line 71
    invoke-interface {p0, v0}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->g0(Ll/q210$b;)V

    .line 72
    .line 73
    .line 74
    :cond_2
    :goto_0
    return-void
.end method

.method public f(Lcom/momo/pub/MomoPipelineModuleRegister$c;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "Pipeline_Normal_pip->PIPLINE"

    .line 6
    .line 7
    const-string v2, "setRecordStateListener success"

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/h410;->b:Ll/c410;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    iget-object v1, p0, Ll/h410;->t:Ll/q210$d;

    .line 17
    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    invoke-interface {v0, v1}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->k0(Ll/q210$d;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    new-instance v0, Ll/h410$d;

    .line 24
    .line 25
    invoke-direct {v0, p0, p1}, Ll/h410$d;-><init>(Ll/h410;Lcom/momo/pub/MomoPipelineModuleRegister$c;)V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Ll/h410;->t:Ll/q210$d;

    .line 29
    .line 30
    iget-object p0, p0, Ll/h410;->b:Ll/c410;

    .line 31
    .line 32
    invoke-interface {p0, v0}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->B0(Ll/q210$d;)V

    .line 33
    .line 34
    .line 35
    :cond_1
    return-void
.end method

.method public g(Ll/h410$e;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/h410;->v:Ll/h410$e;

    .line 2
    .line 3
    return-void
.end method

.method public getParameters()Ll/ror;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/h410;->c:Ll/ror;

    .line 2
    .line 3
    return-object p0
.end method

.method public h(Ll/ror;Z)V
    .locals 3

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v2, " changePushSize parameters:"

    .line 8
    .line 9
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget v2, p1, Ll/tow;->v:I

    .line 13
    .line 14
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v2, " "

    .line 18
    .line 19
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    iget v2, p1, Ll/tow;->u:I

    .line 23
    .line 24
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    const-string v2, "Pipeline_Normal_pip->PIPLINE"

    .line 32
    .line 33
    invoke-virtual {v0, v2, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/h410;->b:Ll/c410;

    .line 37
    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    invoke-interface {v0}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->j0()Ll/g510;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    iget-object v0, p0, Ll/h410;->b:Ll/c410;

    .line 47
    .line 48
    if-eqz p2, :cond_0

    .line 49
    .line 50
    invoke-interface {v0}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->j0()Ll/g510;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iget v1, p1, Ll/tow;->v:I

    .line 55
    .line 56
    iget v2, p1, Ll/tow;->u:I

    .line 57
    .line 58
    invoke-virtual {v0, v1, v2}, Ll/g510;->P(II)V

    .line 59
    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_0
    invoke-interface {v0}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->j0()Ll/g510;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    iget v1, p1, Ll/tow;->u:I

    .line 67
    .line 68
    iget v2, p1, Ll/tow;->v:I

    .line 69
    .line 70
    invoke-virtual {v0, v1, v2}, Ll/g510;->P(II)V

    .line 71
    .line 72
    .line 73
    :cond_1
    :goto_0
    iget-object v0, p0, Ll/h410;->e:Ll/rsy;

    .line 74
    .line 75
    if-eqz v0, :cond_2

    .line 76
    .line 77
    iget-object p0, p0, Ll/h410;->b:Ll/c410;

    .line 78
    .line 79
    invoke-virtual {v0, p0, p1, p2}, Ll/rsy;->S1(Lcom/momo/pipline/MomoInterface/MomoPipeline;Ll/uow;Z)V

    .line 80
    .line 81
    .line 82
    :cond_2
    return-void
.end method

.method public i(IILl/fpf0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/h410;->b:Ll/c410;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2, p3}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->i(IILl/fpf0;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public j(Ll/pvl;)V
    .locals 7

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p0, Ll/h410;->e:Ll/rsy;

    .line 4
    .line 5
    const-string v1, " class:"

    .line 6
    .line 7
    const-string v2, "Pipeline_Normal_pip->PIPLINE"

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-interface {p1}, Ll/pvl;->a()Ll/z5m;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-interface {p1}, Ll/pvl;->a()Ll/z5m;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-interface {v0}, Ll/z5m;->getInput()Ll/gfj;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v3, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    const-string v4, "removeMerge 111"

    .line 34
    .line 35
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-interface {p1}, Ll/pvl;->a()Ll/z5m;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    invoke-virtual {v4}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v4

    .line 50
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    invoke-virtual {v0, v2, v3}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Ll/h410;->e:Ll/rsy;

    .line 67
    .line 68
    invoke-interface {p1}, Ll/pvl;->a()Ll/z5m;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    invoke-interface {v3}, Ll/z5m;->getInput()Ll/gfj;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    invoke-virtual {v0, v3}, Ll/rsy;->Y1(Ll/gfj;)Ll/l6x;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    iget-object v3, p0, Ll/h410;->b:Ll/c410;

    .line 81
    .line 82
    invoke-interface {p1}, Ll/pvl;->a()Ll/z5m;

    .line 83
    .line 84
    .line 85
    move-result-object v4

    .line 86
    invoke-interface {v3, v4}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->Z(Ll/z5m;)Ll/g510;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    iget-object v4, p0, Ll/h410;->b:Ll/c410;

    .line 91
    .line 92
    invoke-interface {p1}, Ll/pvl;->a()Ll/z5m;

    .line 93
    .line 94
    .line 95
    move-result-object v5

    .line 96
    invoke-interface {v5}, Ll/z5m;->getInput()Ll/gfj;

    .line 97
    .line 98
    .line 99
    move-result-object v5

    .line 100
    invoke-virtual {v3}, Ll/g510;->m()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v6

    .line 104
    invoke-interface {v4, v5, v6}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->I(Ll/wej;Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    iget-object v4, p0, Ll/h410;->b:Ll/c410;

    .line 108
    .line 109
    iget-object v0, v0, Ll/l6x;->k:Ll/gfj;

    .line 110
    .line 111
    invoke-virtual {v3}, Ll/g510;->m()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v3

    .line 115
    invoke-interface {v4, v0, v3}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->I(Ll/wej;Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    :cond_0
    invoke-interface {p1}, Ll/pvl;->G()V

    .line 119
    .line 120
    .line 121
    invoke-interface {p1}, Ll/pvl;->a()Ll/z5m;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    if-eqz v0, :cond_1

    .line 126
    .line 127
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    new-instance v3, Ljava/lang/StringBuilder;

    .line 132
    .line 133
    const-string v4, "removeMerge 222"

    .line 134
    .line 135
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    invoke-interface {p1}, Ll/pvl;->a()Ll/z5m;

    .line 139
    .line 140
    .line 141
    move-result-object v4

    .line 142
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 143
    .line 144
    .line 145
    move-result-object v4

    .line 146
    invoke-virtual {v4}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v4

    .line 150
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object v1

    .line 163
    invoke-virtual {v0, v2, v1}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 164
    .line 165
    .line 166
    iget-object p0, p0, Ll/h410;->b:Ll/c410;

    .line 167
    .line 168
    invoke-interface {p1}, Ll/pvl;->a()Ll/z5m;

    .line 169
    .line 170
    .line 171
    move-result-object p1

    .line 172
    invoke-interface {p0, p1}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->Z(Ll/z5m;)Ll/g510;

    .line 173
    .line 174
    .line 175
    move-result-object p0

    .line 176
    if-eqz p0, :cond_1

    .line 177
    .line 178
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 179
    .line 180
    .line 181
    move-result-object p1

    .line 182
    const-string v0, "removeMerge success"

    .line 183
    .line 184
    invoke-virtual {p1, v2, v0}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 185
    .line 186
    .line 187
    invoke-virtual {p0}, Ll/g510;->k()V

    .line 188
    .line 189
    .line 190
    :cond_1
    return-void
.end method

.method public k(Ll/pvl;Ljava/lang/String;FFFFFIII)V
    .locals 14

    .line 1
    iget-object v0, p0, Ll/h410;->e:Ll/rsy;

    if-eqz v0, :cond_1

    if-eqz p1, :cond_1

    invoke-interface {p1}, Ll/pvl;->a()Ll/z5m;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 2
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "setMergePosition, x:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move/from16 v8, p3

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v2, ", y:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move/from16 v9, p4

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v2, ", px:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move/from16 v10, p5

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v2, ", py:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move/from16 v11, p6

    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v2, ",pipeline:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {p1}, Ll/pvl;->a()Ll/z5m;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Pipeline_Normal_pip->PIPLINE"

    invoke-virtual {v0, v2, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 3
    invoke-interface {p1}, Ll/pvl;->a()Ll/z5m;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 4
    invoke-interface {p1}, Ll/pvl;->a()Ll/z5m;

    move-result-object v0

    instance-of v0, v0, Ll/eh0;

    if-eqz v0, :cond_0

    .line 5
    invoke-interface {p1}, Ll/pvl;->a()Ll/z5m;

    move-result-object v0

    check-cast v0, Ll/eh0;

    invoke-virtual {v0}, Ll/eh0;->a2()I

    move-result v0

    .line 6
    invoke-interface {p1}, Ll/pvl;->a()Ll/z5m;

    move-result-object v1

    check-cast v1, Ll/eh0;

    invoke-virtual {v1}, Ll/eh0;->Z1()I

    move-result v1

    .line 7
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "AidInput->renderWidth:"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, ", renderHeight:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "zk->weijiangnan"

    invoke-virtual {v2, v4, v3}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    move v5, v0

    move v6, v1

    goto :goto_0

    :cond_0
    move/from16 v5, p9

    move/from16 v6, p10

    .line 8
    :goto_0
    iget-object v3, p0, Ll/h410;->e:Ll/rsy;

    invoke-interface {p1}, Ll/pvl;->a()Ll/z5m;

    move-result-object p0

    invoke-interface {p0}, Ll/z5m;->getInput()Ll/gfj;

    move-result-object v4

    move-object/from16 v7, p2

    move/from16 v12, p7

    move/from16 v13, p8

    invoke-virtual/range {v3 .. v13}, Ll/rsy;->c2(Ll/gfj;IILjava/lang/String;FFFFFI)V

    :cond_1
    return-void
.end method

.method public l()Lcom/momo/piplinemomoext/input/audio/a;
    .locals 5

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "Pipeline_Normal_pip->PIPLINE"

    .line 6
    .line 7
    const-string v2, "registerAudioControl"

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/h410;->u:Lcom/momo/piplinemomoext/input/audio/a;

    .line 13
    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/h410;->U()Landroid/content/Context;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-object v1, p0, Ll/h410;->c:Ll/ror;

    .line 21
    .line 22
    iget v2, v1, Ll/tow;->P:I

    .line 23
    .line 24
    iget v3, v1, Ll/tow;->R:I

    .line 25
    .line 26
    iget-boolean v1, v1, Ll/tow;->d0:Z

    .line 27
    .line 28
    invoke-static {v0, v2, v3, v1}, Ll/f410;->c(Landroid/content/Context;IIZ)Lcom/momo/piplinemomoext/input/audio/a;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iput-object v0, p0, Ll/h410;->u:Lcom/momo/piplinemomoext/input/audio/a;

    .line 33
    .line 34
    check-cast v0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 35
    .line 36
    iget-object v1, p0, Ll/h410;->c:Ll/ror;

    .line 37
    .line 38
    iget v2, v1, Ll/tow;->P:I

    .line 39
    .line 40
    iget v1, v1, Ll/tow;->R:I

    .line 41
    .line 42
    const-string v3, "NULL"

    .line 43
    .line 44
    const/16 v4, 0x800

    .line 45
    .line 46
    invoke-virtual {v0, v4, v2, v1, v3}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->I2(IIILjava/lang/String;)V

    .line 47
    .line 48
    .line 49
    :cond_0
    iget-object v0, p0, Ll/h410;->b:Ll/c410;

    .line 50
    .line 51
    if-eqz v0, :cond_1

    .line 52
    .line 53
    iget-object v1, p0, Ll/h410;->u:Lcom/momo/piplinemomoext/input/audio/a;

    .line 54
    .line 55
    instance-of v2, v1, Ll/fb1;

    .line 56
    .line 57
    if-eqz v2, :cond_1

    .line 58
    .line 59
    check-cast v1, Ll/fb1;

    .line 60
    .line 61
    invoke-interface {v0, v1}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->D0(Ll/fb1;)V

    .line 62
    .line 63
    .line 64
    :cond_1
    iget-object p0, p0, Ll/h410;->u:Lcom/momo/piplinemomoext/input/audio/a;

    .line 65
    .line 66
    return-object p0
.end method

.method public m(Ll/ror;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/h410;->b:Ll/c410;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->j0()Ll/g510;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/h410;->b:Ll/c410;

    .line 12
    .line 13
    invoke-interface {v0}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->j0()Ll/g510;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget v1, p1, Ll/tow;->u:I

    .line 18
    .line 19
    iget v2, p1, Ll/tow;->v:I

    .line 20
    .line 21
    invoke-virtual {v0, v1, v2}, Ll/g510;->P(II)V

    .line 22
    .line 23
    .line 24
    :cond_0
    iget-object v0, p0, Ll/h410;->e:Ll/rsy;

    .line 25
    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    iget-object p0, p0, Ll/h410;->b:Ll/c410;

    .line 29
    .line 30
    invoke-virtual {v0, p0, p1}, Ll/rsy;->V1(Lcom/momo/pipline/MomoInterface/MomoPipeline;Ll/uow;)V

    .line 31
    .line 32
    .line 33
    :cond_1
    return-void
.end method

.method public n()V
    .locals 3

    .line 1
    new-instance v0, Ll/rsy;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/rsy;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/h410;->e:Ll/rsy;

    .line 7
    .line 8
    iget-object v1, p0, Ll/h410;->c:Ll/ror;

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    iget v2, v1, Ll/tow;->u:I

    .line 13
    .line 14
    iget v1, v1, Ll/tow;->v:I

    .line 15
    .line 16
    invoke-virtual {v0, v2, v1}, Ll/rsy;->setRenderSize(II)V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Ll/h410;->b:Ll/c410;

    .line 20
    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    iget-object p0, p0, Ll/h410;->e:Ll/rsy;

    .line 24
    .line 25
    invoke-interface {v0, p0}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->t0(Ll/rsy;)V

    .line 26
    .line 27
    .line 28
    :cond_1
    return-void
.end method

.method public o()Ll/n5m;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/h410;->b:Ll/c410;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    new-instance v1, Ll/cde0;

    .line 8
    .line 9
    iget-object v2, p0, Ll/h410;->c:Ll/ror;

    .line 10
    .line 11
    invoke-direct {v1, v2, v0}, Ll/cde0;-><init>(Ll/uow;Lcom/momo/pipline/MomoInterface/MomoPipeline;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/h410;->j:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 15
    .line 16
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-virtual {v0, v2, v1}, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/h410;->o:Ll/pvl;

    .line 24
    .line 25
    if-nez v0, :cond_1

    .line 26
    .line 27
    iput-object v1, p0, Ll/h410;->o:Ll/pvl;

    .line 28
    .line 29
    :cond_1
    return-object v1
.end method

.method public p(Ll/ror;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v2, " changePushSize parameters:"

    .line 8
    .line 9
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget v2, p1, Ll/tow;->v:I

    .line 13
    .line 14
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v2, " "

    .line 18
    .line 19
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    iget v2, p1, Ll/tow;->u:I

    .line 23
    .line 24
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    const-string v2, "Pipeline_Normal_pip->PIPLINE"

    .line 32
    .line 33
    invoke-virtual {v0, v2, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/h410;->b:Ll/c410;

    .line 37
    .line 38
    if-eqz v0, :cond_0

    .line 39
    .line 40
    invoke-interface {v0}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->j0()Ll/g510;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    if-eqz v0, :cond_0

    .line 45
    .line 46
    iget-object v0, p0, Ll/h410;->b:Ll/c410;

    .line 47
    .line 48
    invoke-interface {v0}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->j0()Ll/g510;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    iget v1, p1, Ll/tow;->u:I

    .line 53
    .line 54
    iget v2, p1, Ll/tow;->v:I

    .line 55
    .line 56
    invoke-virtual {v0, v1, v2}, Ll/g510;->P(II)V

    .line 57
    .line 58
    .line 59
    :cond_0
    iget-object v0, p0, Ll/h410;->e:Ll/rsy;

    .line 60
    .line 61
    if-eqz v0, :cond_1

    .line 62
    .line 63
    iget-object p0, p0, Ll/h410;->b:Ll/c410;

    .line 64
    .line 65
    invoke-virtual {v0, p0, p1}, Ll/rsy;->T1(Lcom/momo/pipline/MomoInterface/MomoPipeline;Ll/uow;)V

    .line 66
    .line 67
    .line 68
    :cond_1
    return-void
.end method

.method public q(Ll/pvl;Ljava/lang/String;)V
    .locals 10

    .line 1
    invoke-interface {p1}, Ll/pvl;->a()Ll/z5m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string v2, "mergeInput"

    .line 14
    .line 15
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-interface {p1}, Ll/pvl;->a()Ll/z5m;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v2, " class:"

    .line 34
    .line 35
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string v2, " key:"

    .line 42
    .line 43
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    const-string v2, "Pipeline_Normal_pip->PIPLINE"

    .line 54
    .line 55
    invoke-virtual {v0, v2, v1}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    :cond_0
    const/16 v8, 0x1e0

    .line 59
    .line 60
    const/16 v9, 0x1e0

    .line 61
    .line 62
    const/16 v6, 0x1e0

    .line 63
    .line 64
    const/16 v7, 0x280

    .line 65
    .line 66
    move-object v3, p0

    .line 67
    move-object v4, p1

    .line 68
    move-object v5, p2

    .line 69
    invoke-virtual/range {v3 .. v9}, Ll/h410;->V(Ll/pvl;Ljava/lang/String;IIII)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public r(IZLl/brx;)Ll/lvl;
    .locals 10

    .line 1
    iget-object v0, p0, Ll/h410;->b:Ll/c410;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string v2, "registerIjkInput type:"

    .line 14
    .line 15
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    const-string v2, "Pipeline_Normal_pip->PIPLINE"

    .line 26
    .line 27
    invoke-virtual {v0, v2, v1}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    new-instance v3, Ll/vfm;

    .line 31
    .line 32
    iget-object v4, p0, Ll/h410;->c:Ll/ror;

    .line 33
    .line 34
    iget-object v5, p0, Ll/h410;->b:Ll/c410;

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/h410;->U()Landroid/content/Context;

    .line 37
    .line 38
    .line 39
    move-result-object v6

    .line 40
    move v7, p1

    .line 41
    move v8, p2

    .line 42
    move-object v9, p3

    .line 43
    invoke-direct/range {v3 .. v9}, Ll/vfm;-><init>(Ll/uow;Lcom/momo/pipline/MomoInterface/MomoPipeline;Landroid/content/Context;IZLl/brx;)V

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Ll/h410;->l:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 47
    .line 48
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    invoke-virtual {p1, p2, v3}, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    iget-object p1, p0, Ll/h410;->o:Ll/pvl;

    .line 56
    .line 57
    if-nez p1, :cond_1

    .line 58
    .line 59
    iput-object v3, p0, Ll/h410;->o:Ll/pvl;

    .line 60
    .line 61
    :cond_1
    return-object v3
.end method

.method public s(II)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/h410;->e:Ll/rsy;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/rsy;->Z1(II)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public declared-synchronized t()V
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    const-string v1, "Pipeline_Normal_pip->PIPLINE"

    .line 7
    .line 8
    const-string v2, "stopRegister"

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/h410;->p:Ll/epl;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-interface {v0}, Ll/epl;->stopAudio()V

    .line 19
    .line 20
    .line 21
    iput-object v1, p0, Ll/h410;->p:Ll/epl;

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :catchall_0
    move-exception v0

    .line 25
    goto/16 :goto_8

    .line 26
    .line 27
    :cond_0
    :goto_0
    invoke-static {}, Ll/f410;->g()V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/h410;->j:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/util/AbstractMap;->values()Ljava/util/Collection;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    if-eqz v2, :cond_1

    .line 45
    .line 46
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    check-cast v2, Ll/n5m;

    .line 51
    .line 52
    invoke-interface {v2}, Ll/pvl;->G()V

    .line 53
    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_1
    iget-object v0, p0, Ll/h410;->k:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 57
    .line 58
    invoke-virtual {v0}, Ljava/util/AbstractMap;->values()Ljava/util/Collection;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    if-eqz v2, :cond_2

    .line 71
    .line 72
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    check-cast v2, Ll/cql;

    .line 77
    .line 78
    invoke-interface {v2}, Ll/pvl;->G()V

    .line 79
    .line 80
    .line 81
    goto :goto_2

    .line 82
    :cond_2
    iget-object v0, p0, Ll/h410;->m:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 83
    .line 84
    invoke-virtual {v0}, Ljava/util/AbstractMap;->values()Ljava/util/Collection;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    :goto_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 93
    .line 94
    .line 95
    move-result v2

    .line 96
    if-eqz v2, :cond_3

    .line 97
    .line 98
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object v2

    .line 102
    check-cast v2, Ll/mvl;

    .line 103
    .line 104
    invoke-interface {v2}, Ll/pvl;->G()V

    .line 105
    .line 106
    .line 107
    goto :goto_3

    .line 108
    :cond_3
    iget-object v0, p0, Ll/h410;->l:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 109
    .line 110
    invoke-virtual {v0}, Ljava/util/AbstractMap;->values()Ljava/util/Collection;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 119
    .line 120
    .line 121
    move-result v2

    .line 122
    if-eqz v2, :cond_4

    .line 123
    .line 124
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    move-result-object v2

    .line 128
    check-cast v2, Ll/lvl;

    .line 129
    .line 130
    invoke-interface {v2}, Ll/pvl;->G()V

    .line 131
    .line 132
    .line 133
    goto :goto_4

    .line 134
    :cond_4
    iget-object v0, p0, Ll/h410;->j:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 135
    .line 136
    invoke-virtual {v0}, Ljava/util/AbstractMap;->clear()V

    .line 137
    .line 138
    .line 139
    iget-object v0, p0, Ll/h410;->k:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 140
    .line 141
    invoke-virtual {v0}, Ljava/util/AbstractMap;->clear()V

    .line 142
    .line 143
    .line 144
    iget-object v0, p0, Ll/h410;->m:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 145
    .line 146
    invoke-virtual {v0}, Ljava/util/AbstractMap;->clear()V

    .line 147
    .line 148
    .line 149
    iget-object v0, p0, Ll/h410;->l:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 150
    .line 151
    invoke-virtual {v0}, Ljava/util/AbstractMap;->clear()V

    .line 152
    .line 153
    .line 154
    iget-object v0, p0, Ll/h410;->n:Ll/usl;

    .line 155
    .line 156
    if-eqz v0, :cond_5

    .line 157
    .line 158
    invoke-interface {v0}, Ll/pvl;->G()V

    .line 159
    .line 160
    .line 161
    iput-object v1, p0, Ll/h410;->n:Ll/usl;

    .line 162
    .line 163
    :cond_5
    iget-object v0, p0, Ll/h410;->i:Ljava/util/List;

    .line 164
    .line 165
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 166
    .line 167
    .line 168
    move-result v0

    .line 169
    if-nez v0, :cond_7

    .line 170
    .line 171
    iget-object v0, p0, Ll/h410;->i:Ljava/util/List;

    .line 172
    .line 173
    monitor-enter v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 174
    :try_start_1
    iget-object v2, p0, Ll/h410;->i:Ljava/util/List;

    .line 175
    .line 176
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 177
    .line 178
    .line 179
    move-result-object v2

    .line 180
    :goto_5
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 181
    .line 182
    .line 183
    move-result v3

    .line 184
    if-eqz v3, :cond_6

    .line 185
    .line 186
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 187
    .line 188
    .line 189
    move-result-object v3

    .line 190
    check-cast v3, Ll/fr2;

    .line 191
    .line 192
    invoke-virtual {v3}, Ll/fr2;->f()V

    .line 193
    .line 194
    .line 195
    goto :goto_5

    .line 196
    :catchall_1
    move-exception v1

    .line 197
    goto :goto_6

    .line 198
    :cond_6
    iget-object v2, p0, Ll/h410;->i:Ljava/util/List;

    .line 199
    .line 200
    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 201
    .line 202
    .line 203
    monitor-exit v0

    .line 204
    goto :goto_7

    .line 205
    :goto_6
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 206
    :try_start_2
    throw v1

    .line 207
    :cond_7
    :goto_7
    iget-object v0, p0, Ll/h410;->u:Lcom/momo/piplinemomoext/input/audio/a;

    .line 208
    .line 209
    if-eqz v0, :cond_8

    .line 210
    .line 211
    invoke-interface {v0}, Ll/l6m;->stopSurroundMusic()V

    .line 212
    .line 213
    .line 214
    iget-object v0, p0, Ll/h410;->u:Lcom/momo/piplinemomoext/input/audio/a;

    .line 215
    .line 216
    invoke-interface {v0}, Ll/l6m;->d1()V

    .line 217
    .line 218
    .line 219
    :cond_8
    iget-object v0, p0, Ll/h410;->b:Ll/c410;

    .line 220
    .line 221
    if-eqz v0, :cond_9

    .line 222
    .line 223
    invoke-interface {v0}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->f()V

    .line 224
    .line 225
    .line 226
    iget-object v0, p0, Ll/h410;->b:Ll/c410;

    .line 227
    .line 228
    invoke-interface {v0}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->G()V

    .line 229
    .line 230
    .line 231
    iget-object v0, p0, Ll/h410;->b:Ll/c410;

    .line 232
    .line 233
    invoke-interface {v0}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->c0()V

    .line 234
    .line 235
    .line 236
    iget-object v0, p0, Ll/h410;->b:Ll/c410;

    .line 237
    .line 238
    invoke-interface {v0}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->p0()V

    .line 239
    .line 240
    .line 241
    iget-object v0, p0, Ll/h410;->b:Ll/c410;

    .line 242
    .line 243
    invoke-interface {v0}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->a0()V

    .line 244
    .line 245
    .line 246
    iget-object v0, p0, Ll/h410;->b:Ll/c410;

    .line 247
    .line 248
    invoke-interface {v0}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->release()V

    .line 249
    .line 250
    .line 251
    :cond_9
    iput-object v1, p0, Ll/h410;->t:Ll/q210$d;

    .line 252
    .line 253
    iput-object v1, p0, Ll/h410;->s:Ll/q210$b;

    .line 254
    .line 255
    iput-object v1, p0, Ll/h410;->r:Ll/q210$c;

    .line 256
    .line 257
    iput-object v1, p0, Ll/h410;->o:Ll/pvl;

    .line 258
    .line 259
    invoke-virtual {p0}, Ll/h410;->X()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 260
    .line 261
    .line 262
    monitor-exit p0

    .line 263
    return-void

    .line 264
    :goto_8
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 265
    throw v0
.end method

.method public u(IIIIZ)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/h410;->e:Ll/rsy;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2, p5}, Ll/rsy;->b2(IIZ)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/h410;->e:Ll/rsy;

    .line 9
    .line 10
    invoke-virtual {p0, p3, p4}, Ll/rsy;->Z1(II)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public v(Ll/ror;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v2, " changePushSize parameters:"

    .line 8
    .line 9
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget v2, p1, Ll/tow;->v:I

    .line 13
    .line 14
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v2, " "

    .line 18
    .line 19
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    iget v2, p1, Ll/tow;->u:I

    .line 23
    .line 24
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    const-string v2, "Pipeline_Normal_pip->PIPLINE"

    .line 32
    .line 33
    invoke-virtual {v0, v2, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/h410;->b:Ll/c410;

    .line 37
    .line 38
    if-eqz v0, :cond_0

    .line 39
    .line 40
    invoke-interface {v0}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->j0()Ll/g510;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    if-eqz v0, :cond_0

    .line 45
    .line 46
    iget-object v0, p0, Ll/h410;->b:Ll/c410;

    .line 47
    .line 48
    invoke-interface {v0}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->j0()Ll/g510;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    iget v1, p1, Ll/tow;->u:I

    .line 53
    .line 54
    iget v2, p1, Ll/tow;->v:I

    .line 55
    .line 56
    invoke-virtual {v0, v1, v2}, Ll/g510;->P(II)V

    .line 57
    .line 58
    .line 59
    :cond_0
    iget-object v0, p0, Ll/h410;->e:Ll/rsy;

    .line 60
    .line 61
    if-eqz v0, :cond_1

    .line 62
    .line 63
    iget-object p0, p0, Ll/h410;->b:Ll/c410;

    .line 64
    .line 65
    invoke-virtual {v0, p0, p1}, Ll/rsy;->W1(Lcom/momo/pipline/MomoInterface/MomoPipeline;Ll/uow;)V

    .line 66
    .line 67
    .line 68
    :cond_1
    return-void
.end method

.method public w(Ll/pvl;Ljava/lang/String;FFFFFI)V
    .locals 14

    .line 1
    iget-object v0, p0, Ll/h410;->e:Ll/rsy;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v2, "setMergePosition, x:"

    .line 12
    .line 13
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    move/from16 v8, p3

    .line 17
    .line 18
    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v2, ", y:"

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    move/from16 v9, p4

    .line 27
    .line 28
    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v2, ", px:"

    .line 32
    .line 33
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    move/from16 v10, p5

    .line 37
    .line 38
    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string v2, ", py:"

    .line 42
    .line 43
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    move/from16 v11, p6

    .line 47
    .line 48
    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    const-string v2, ",pipeline:"

    .line 52
    .line 53
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-interface {p1}, Ll/pvl;->a()Ll/z5m;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    const-string v2, "Pipeline_Normal_pip->PIPLINE"

    .line 68
    .line 69
    invoke-virtual {v0, v2, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    invoke-interface {p1}, Ll/pvl;->a()Ll/z5m;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    const-string v1, ", renderHeight:"

    .line 77
    .line 78
    if-eqz v0, :cond_0

    .line 79
    .line 80
    invoke-interface {p1}, Ll/pvl;->a()Ll/z5m;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    instance-of v0, v0, Ll/eh0;

    .line 85
    .line 86
    if-eqz v0, :cond_0

    .line 87
    .line 88
    invoke-interface {p1}, Ll/pvl;->a()Ll/z5m;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    check-cast v0, Ll/eh0;

    .line 93
    .line 94
    invoke-virtual {v0}, Ll/eh0;->a2()I

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    invoke-interface {p1}, Ll/pvl;->a()Ll/z5m;

    .line 99
    .line 100
    .line 101
    move-result-object v3

    .line 102
    check-cast v3, Ll/eh0;

    .line 103
    .line 104
    invoke-virtual {v3}, Ll/eh0;->Z1()I

    .line 105
    .line 106
    .line 107
    move-result v3

    .line 108
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 109
    .line 110
    .line 111
    move-result-object v4

    .line 112
    new-instance v5, Ljava/lang/StringBuilder;

    .line 113
    .line 114
    const-string v6, "AidInput->renderWidth:"

    .line 115
    .line 116
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v5

    .line 132
    invoke-virtual {v4, v2, v5}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    goto :goto_0

    .line 136
    :cond_0
    const/16 v0, 0x1e0

    .line 137
    .line 138
    move v3, v0

    .line 139
    :goto_0
    invoke-interface {p1}, Ll/pvl;->a()Ll/z5m;

    .line 140
    .line 141
    .line 142
    move-result-object v4

    .line 143
    if-eqz v4, :cond_1

    .line 144
    .line 145
    invoke-interface {p1}, Ll/pvl;->a()Ll/z5m;

    .line 146
    .line 147
    .line 148
    move-result-object v4

    .line 149
    instance-of v4, v4, Ll/sti0;

    .line 150
    .line 151
    if-eqz v4, :cond_1

    .line 152
    .line 153
    invoke-interface {p1}, Ll/pvl;->a()Ll/z5m;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    check-cast v0, Ll/sti0;

    .line 158
    .line 159
    invoke-virtual {v0}, Ll/sti0;->R1()I

    .line 160
    .line 161
    .line 162
    move-result v0

    .line 163
    invoke-interface {p1}, Ll/pvl;->a()Ll/z5m;

    .line 164
    .line 165
    .line 166
    move-result-object v3

    .line 167
    check-cast v3, Ll/sti0;

    .line 168
    .line 169
    invoke-virtual {v3}, Ll/sti0;->Q1()I

    .line 170
    .line 171
    .line 172
    move-result v3

    .line 173
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 174
    .line 175
    .line 176
    move-result-object v4

    .line 177
    new-instance v5, Ljava/lang/StringBuilder;

    .line 178
    .line 179
    const-string v6, "TextureInput->renderWidth:"

    .line 180
    .line 181
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 182
    .line 183
    .line 184
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 185
    .line 186
    .line 187
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 188
    .line 189
    .line 190
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 191
    .line 192
    .line 193
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object v1

    .line 197
    invoke-virtual {v4, v2, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 198
    .line 199
    .line 200
    :cond_1
    move v5, v0

    .line 201
    move v6, v3

    .line 202
    iget-object v3, p0, Ll/h410;->e:Ll/rsy;

    .line 203
    .line 204
    invoke-interface {p1}, Ll/pvl;->a()Ll/z5m;

    .line 205
    .line 206
    .line 207
    move-result-object p0

    .line 208
    invoke-interface {p0}, Ll/z5m;->getInput()Ll/gfj;

    .line 209
    .line 210
    .line 211
    move-result-object v4

    .line 212
    move-object/from16 v7, p2

    .line 213
    .line 214
    move/from16 v12, p7

    .line 215
    .line 216
    move/from16 v13, p8

    .line 217
    .line 218
    invoke-virtual/range {v3 .. v13}, Ll/rsy;->c2(Ll/gfj;IILjava/lang/String;FFFFFI)V

    .line 219
    .line 220
    .line 221
    :cond_2
    return-void
.end method

.method public x()Ll/dpl;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/h410;->q:Ll/dpl;

    .line 2
    .line 3
    return-object p0
.end method

.method public y(Ll/ror;)V
    .locals 0
    .param p1    # Ll/ror;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Ll/h410;->c:Ll/ror;

    .line 2
    .line 3
    return-void
.end method

.method public declared-synchronized z(Ll/c4m;)V
    .locals 5

    .line 1
    const-string v0, "unregisterPusher"

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/h410;->b:Ll/c410;

    .line 5
    .line 6
    if-eqz v1, :cond_9

    .line 7
    .line 8
    iget-object v1, p0, Ll/h410;->i:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    goto/16 :goto_4

    .line 17
    .line 18
    :cond_0
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    const-string v2, "Pipeline_Normal_pip->PIPLINE"

    .line 23
    .line 24
    new-instance v3, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v1, v2, v0}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ll/h410;->i:Ljava/util/List;

    .line 40
    .line 41
    monitor-enter v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 42
    :try_start_1
    iget-object v1, p0, Ll/h410;->i:Ljava/util/List;

    .line 43
    .line 44
    invoke-interface {v1, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    iget-object v1, p0, Ll/h410;->i:Ljava/util/List;

    .line 48
    .line 49
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    const/4 v2, 0x0

    .line 54
    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    if-eqz v3, :cond_3

    .line 59
    .line 60
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    check-cast v3, Ll/c4m;

    .line 65
    .line 66
    instance-of v4, v3, Ll/hwl;

    .line 67
    .line 68
    if-eqz v4, :cond_1

    .line 69
    .line 70
    iget-object v2, p0, Ll/h410;->p:Ll/epl;

    .line 71
    .line 72
    if-eqz v2, :cond_2

    .line 73
    .line 74
    invoke-interface {v3}, Ll/c4m;->m2()Ll/dpl;

    .line 75
    .line 76
    .line 77
    move-result-object v3

    .line 78
    invoke-interface {v2, v3}, Ll/epl;->c(Ll/dpl;)V

    .line 79
    .line 80
    .line 81
    goto :goto_1

    .line 82
    :catchall_0
    move-exception p1

    .line 83
    goto/16 :goto_3

    .line 84
    .line 85
    :cond_2
    :goto_1
    const/4 v2, 0x1

    .line 86
    goto :goto_0

    .line 87
    :cond_3
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 88
    :try_start_2
    instance-of v0, p1, Ll/hwl;

    .line 89
    .line 90
    if-eqz v0, :cond_5

    .line 91
    .line 92
    invoke-interface {p1}, Ll/c4m;->m2()Ll/dpl;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    iget-object v0, p0, Ll/h410;->q:Ll/dpl;

    .line 97
    .line 98
    if-ne p1, v0, :cond_5

    .line 99
    .line 100
    iget-object p1, p0, Ll/h410;->p:Ll/epl;

    .line 101
    .line 102
    if-eqz p1, :cond_4

    .line 103
    .line 104
    invoke-interface {p1}, Ll/epl;->stopAudio()V

    .line 105
    .line 106
    .line 107
    goto :goto_2

    .line 108
    :catchall_1
    move-exception p1

    .line 109
    goto/16 :goto_5

    .line 110
    .line 111
    :cond_4
    :goto_2
    const/4 p1, 0x0

    .line 112
    iput-object p1, p0, Ll/h410;->p:Ll/epl;

    .line 113
    .line 114
    iput-object p1, p0, Ll/h410;->q:Ll/dpl;

    .line 115
    .line 116
    :cond_5
    if-nez v2, :cond_6

    .line 117
    .line 118
    iget-object p1, p0, Ll/h410;->p:Ll/epl;

    .line 119
    .line 120
    if-eqz p1, :cond_6

    .line 121
    .line 122
    iget-object v0, p0, Ll/h410;->c:Ll/ror;

    .line 123
    .line 124
    iget-object v1, p0, Ll/h410;->b:Ll/c410;

    .line 125
    .line 126
    invoke-interface {v1}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->A0()Ll/q210$a;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    invoke-static {v0, v1}, Ll/f410;->a(Ll/uow;Ll/q210$a;)Ll/dpl;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    if-eq p1, v0, :cond_6

    .line 135
    .line 136
    iget-object p1, p0, Ll/h410;->p:Ll/epl;

    .line 137
    .line 138
    iget-object v0, p0, Ll/h410;->c:Ll/ror;

    .line 139
    .line 140
    iget-object v1, p0, Ll/h410;->b:Ll/c410;

    .line 141
    .line 142
    invoke-interface {v1}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->A0()Ll/q210$a;

    .line 143
    .line 144
    .line 145
    move-result-object v1

    .line 146
    invoke-static {v0, v1}, Ll/f410;->a(Ll/uow;Ll/q210$a;)Ll/dpl;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    invoke-interface {p1, v0}, Ll/epl;->c(Ll/dpl;)V

    .line 151
    .line 152
    .line 153
    iget-object p1, p0, Ll/h410;->b:Ll/c410;

    .line 154
    .line 155
    iget-object v0, p0, Ll/h410;->p:Ll/epl;

    .line 156
    .line 157
    invoke-interface {v0}, Ll/epl;->b()Ll/dpl;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    invoke-interface {p1, v0}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->C0(Ll/dpl;)V

    .line 162
    .line 163
    .line 164
    iget-object p1, p0, Ll/h410;->p:Ll/epl;

    .line 165
    .line 166
    invoke-interface {p1}, Ll/epl;->a()V

    .line 167
    .line 168
    .line 169
    :cond_6
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 170
    .line 171
    .line 172
    move-result-object p1

    .line 173
    new-instance v0, Ljava/lang/StringBuilder;

    .line 174
    .line 175
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 176
    .line 177
    .line 178
    const-string v1, "unregisterPusher mPusherList="

    .line 179
    .line 180
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 181
    .line 182
    .line 183
    iget-object v1, p0, Ll/h410;->i:Ljava/util/List;

    .line 184
    .line 185
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 186
    .line 187
    .line 188
    move-result v1

    .line 189
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 190
    .line 191
    .line 192
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    invoke-virtual {p1, v0}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 201
    .line 202
    .line 203
    iget-object p1, p0, Ll/h410;->i:Ljava/util/List;

    .line 204
    .line 205
    if-eqz p1, :cond_8

    .line 206
    .line 207
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 208
    .line 209
    .line 210
    move-result p1

    .line 211
    if-lez p1, :cond_8

    .line 212
    .line 213
    iget-object p1, p0, Ll/h410;->p:Ll/epl;

    .line 214
    .line 215
    if-eqz p1, :cond_7

    .line 216
    .line 217
    iget-object p1, p0, Ll/h410;->q:Ll/dpl;

    .line 218
    .line 219
    if-nez p1, :cond_8

    .line 220
    .line 221
    :cond_7
    invoke-virtual {p0}, Ll/h410;->W()Ll/epl;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 222
    .line 223
    .line 224
    :cond_8
    monitor-exit p0

    .line 225
    return-void

    .line 226
    :goto_3
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 227
    :try_start_4
    throw p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 228
    :cond_9
    :goto_4
    monitor-exit p0

    .line 229
    return-void

    .line 230
    :goto_5
    :try_start_5
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 231
    throw p1
.end method
