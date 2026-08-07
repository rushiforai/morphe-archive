.class public Lcom/immomo/moment/mediautils/p;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private final a:Ljava/lang/String;

.field private b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private c:Ljava/lang/String;

.field private d:Ll/d710;

.field private e:Lcom/immomo/moment/mediautils/j;

.field private f:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Ll/ad60;",
            ">;"
        }
    .end annotation
.end field

.field private g:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Ll/ad60;",
            ">;"
        }
    .end annotation
.end field

.field h:Ljava/lang/Object;

.field i:Ljava/lang/Object;

.field j:Ljava/lang/Object;

.field private k:Ljava/lang/Thread;

.field private l:Ljava/lang/Thread;

.field private m:I

.field private n:I

.field private o:I

.field private p:Z

.field private q:Z

.field private r:Z

.field private s:J

.field private t:I

.field private u:I

.field private v:Ll/kpw;

.field private w:Ll/spw;

.field private x:Ljava/lang/Runnable;

.field private y:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "MediaSplicingThread"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/immomo/moment/mediautils/p;->a:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/immomo/moment/mediautils/p;->b:Ljava/util/List;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/immomo/moment/mediautils/p;->c:Ljava/lang/String;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/immomo/moment/mediautils/p;->d:Ll/d710;

    .line 14
    .line 15
    iput-object v0, p0, Lcom/immomo/moment/mediautils/p;->e:Lcom/immomo/moment/mediautils/j;

    .line 16
    .line 17
    iput-object v0, p0, Lcom/immomo/moment/mediautils/p;->f:Ljava/util/LinkedList;

    .line 18
    .line 19
    iput-object v0, p0, Lcom/immomo/moment/mediautils/p;->g:Ljava/util/LinkedList;

    .line 20
    .line 21
    new-instance v1, Ljava/lang/Object;

    .line 22
    .line 23
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object v1, p0, Lcom/immomo/moment/mediautils/p;->h:Ljava/lang/Object;

    .line 27
    .line 28
    new-instance v1, Ljava/lang/Object;

    .line 29
    .line 30
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 31
    .line 32
    .line 33
    iput-object v1, p0, Lcom/immomo/moment/mediautils/p;->i:Ljava/lang/Object;

    .line 34
    .line 35
    new-instance v1, Ljava/lang/Object;

    .line 36
    .line 37
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 38
    .line 39
    .line 40
    iput-object v1, p0, Lcom/immomo/moment/mediautils/p;->j:Ljava/lang/Object;

    .line 41
    .line 42
    iput-object v0, p0, Lcom/immomo/moment/mediautils/p;->k:Ljava/lang/Thread;

    .line 43
    .line 44
    iput-object v0, p0, Lcom/immomo/moment/mediautils/p;->l:Ljava/lang/Thread;

    .line 45
    .line 46
    const/4 v1, 0x0

    .line 47
    iput v1, p0, Lcom/immomo/moment/mediautils/p;->m:I

    .line 48
    .line 49
    iput v1, p0, Lcom/immomo/moment/mediautils/p;->n:I

    .line 50
    .line 51
    iput v1, p0, Lcom/immomo/moment/mediautils/p;->o:I

    .line 52
    .line 53
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/p;->p:Z

    .line 54
    .line 55
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/p;->q:Z

    .line 56
    .line 57
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/p;->r:Z

    .line 58
    .line 59
    const-wide/32 v2, 0x989680

    .line 60
    .line 61
    .line 62
    iput-wide v2, p0, Lcom/immomo/moment/mediautils/p;->s:J

    .line 63
    .line 64
    iput v1, p0, Lcom/immomo/moment/mediautils/p;->t:I

    .line 65
    .line 66
    const v1, 0x186a0

    .line 67
    .line 68
    .line 69
    iput v1, p0, Lcom/immomo/moment/mediautils/p;->u:I

    .line 70
    .line 71
    iput-object v0, p0, Lcom/immomo/moment/mediautils/p;->v:Ll/kpw;

    .line 72
    .line 73
    iput-object v0, p0, Lcom/immomo/moment/mediautils/p;->w:Ll/spw;

    .line 74
    .line 75
    new-instance v0, Lcom/immomo/moment/mediautils/p$b;

    .line 76
    .line 77
    invoke-direct {v0, p0}, Lcom/immomo/moment/mediautils/p$b;-><init>(Lcom/immomo/moment/mediautils/p;)V

    .line 78
    .line 79
    .line 80
    iput-object v0, p0, Lcom/immomo/moment/mediautils/p;->x:Ljava/lang/Runnable;

    .line 81
    .line 82
    new-instance v0, Lcom/immomo/moment/mediautils/p$c;

    .line 83
    .line 84
    invoke-direct {v0, p0}, Lcom/immomo/moment/mediautils/p$c;-><init>(Lcom/immomo/moment/mediautils/p;)V

    .line 85
    .line 86
    .line 87
    iput-object v0, p0, Lcom/immomo/moment/mediautils/p;->y:Ljava/lang/Runnable;

    .line 88
    .line 89
    new-instance v0, Ljava/util/LinkedList;

    .line 90
    .line 91
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 92
    .line 93
    .line 94
    iput-object v0, p0, Lcom/immomo/moment/mediautils/p;->f:Ljava/util/LinkedList;

    .line 95
    .line 96
    new-instance v0, Ljava/util/LinkedList;

    .line 97
    .line 98
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 99
    .line 100
    .line 101
    iput-object v0, p0, Lcom/immomo/moment/mediautils/p;->g:Ljava/util/LinkedList;

    .line 102
    .line 103
    return-void
.end method

.method public static synthetic a(Lcom/immomo/moment/mediautils/p;)Ll/spw;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/p;->w:Ll/spw;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b(Lcom/immomo/moment/mediautils/p;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/moment/mediautils/p;->p:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic c(Lcom/immomo/moment/mediautils/p;)Ll/kpw;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/p;->v:Ll/kpw;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic d(Lcom/immomo/moment/mediautils/p;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/moment/mediautils/p;->t:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic e(Lcom/immomo/moment/mediautils/p;)Ljava/util/LinkedList;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/p;->f:Ljava/util/LinkedList;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic f(Lcom/immomo/moment/mediautils/p;)Ljava/util/LinkedList;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/p;->g:Ljava/util/LinkedList;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic g(Lcom/immomo/moment/mediautils/p;)Lcom/immomo/moment/mediautils/j;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/p;->e:Lcom/immomo/moment/mediautils/j;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic h(Lcom/immomo/moment/mediautils/p;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/p;->b:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic i(Lcom/immomo/moment/mediautils/p;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/moment/mediautils/p;->q:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic j(Lcom/immomo/moment/mediautils/p;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/moment/mediautils/p;->q:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic k(Lcom/immomo/moment/mediautils/p;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/moment/mediautils/p;->n:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic l(Lcom/immomo/moment/mediautils/p;)Ll/d710;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/p;->d:Ll/d710;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic m(Lcom/immomo/moment/mediautils/p;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/moment/mediautils/p;->m:I

    .line 2
    .line 3
    return p0
.end method

.method private n(Ljava/util/List;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_2

    .line 14
    .line 15
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Ljava/lang/String;

    .line 20
    .line 21
    new-instance v2, Ljava/io/File;

    .line 22
    .line 23
    invoke-direct {v2, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    const-string v4, "Media_Splicing"

    .line 31
    .line 32
    if-eqz v3, :cond_1

    .line 33
    .line 34
    :try_start_0
    new-instance v1, Ljava/io/FileInputStream;

    .line 35
    .line 36
    invoke-direct {v1, v2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 37
    .line 38
    .line 39
    iget v2, p0, Lcom/immomo/moment/mediautils/p;->t:I

    .line 40
    .line 41
    invoke-virtual {v1}, Ljava/io/FileInputStream;->available()I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    add-int/2addr v2, v1

    .line 46
    iput v2, p0, Lcom/immomo/moment/mediautils/p;->t:I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :catch_0
    move-exception p0

    .line 50
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-static {v4, p0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    return v0

    .line 58
    :cond_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 59
    .line 60
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    const-string p1, " File not exist !!"

    .line 67
    .line 68
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-static {v4, p0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    return v0

    .line 79
    :cond_2
    const/4 p0, 0x1

    .line 80
    return p0
.end method


# virtual methods
.method public o()V
    .locals 10

    .line 1
    const-string v0, "Release failed when splice video !!! "

    .line 2
    .line 3
    const-string v1, "Release failed when splice video !!! "

    .line 4
    .line 5
    const-string v2, "Release failed when splice video !!! "

    .line 6
    .line 7
    const-string v3, "Release failed when splice video !!! "

    .line 8
    .line 9
    iget-object v4, p0, Lcom/immomo/moment/mediautils/p;->j:Ljava/lang/Object;

    .line 10
    .line 11
    monitor-enter v4

    .line 12
    :try_start_0
    iget-boolean v5, p0, Lcom/immomo/moment/mediautils/p;->p:Z

    .line 13
    .line 14
    if-nez v5, :cond_4

    .line 15
    .line 16
    const/4 v5, 0x1

    .line 17
    iput-boolean v5, p0, Lcom/immomo/moment/mediautils/p;->p:Z

    .line 18
    .line 19
    iget-object v5, p0, Lcom/immomo/moment/mediautils/p;->k:Ljava/lang/Thread;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    .line 21
    const/16 v6, 0x3ee

    .line 22
    .line 23
    const/4 v7, 0x0

    .line 24
    if-eqz v5, :cond_1

    .line 25
    .line 26
    const-wide/16 v8, 0xc8

    .line 27
    .line 28
    :try_start_1
    invoke-virtual {v5, v8, v9}, Ljava/lang/Thread;->join(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :catchall_0
    move-exception p0

    .line 33
    goto/16 :goto_2

    .line 34
    .line 35
    :catch_0
    move-exception v5

    .line 36
    :try_start_2
    const-string v8, "Media_Splicing"

    .line 37
    .line 38
    new-instance v9, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    invoke-direct {v9, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    invoke-static {v8, v3}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    iget-object v3, p0, Lcom/immomo/moment/mediautils/p;->w:Ll/spw;

    .line 58
    .line 59
    if-eqz v3, :cond_0

    .line 60
    .line 61
    new-instance v8, Ljava/lang/StringBuilder;

    .line 62
    .line 63
    invoke-direct {v8, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    invoke-interface {v3, v6, v2}, Ll/spw;->onFail(ILjava/lang/String;)V

    .line 78
    .line 79
    .line 80
    :cond_0
    :goto_0
    iput-object v7, p0, Lcom/immomo/moment/mediautils/p;->k:Ljava/lang/Thread;

    .line 81
    .line 82
    :cond_1
    iget-object v2, p0, Lcom/immomo/moment/mediautils/p;->l:Ljava/lang/Thread;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 83
    .line 84
    if-eqz v2, :cond_3

    .line 85
    .line 86
    const-wide/16 v8, 0x32

    .line 87
    .line 88
    :try_start_3
    invoke-virtual {v2, v8, v9}, Ljava/lang/Thread;->join(J)V
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 89
    .line 90
    .line 91
    goto :goto_1

    .line 92
    :catch_1
    move-exception v2

    .line 93
    :try_start_4
    const-string v3, "Media_Splicing"

    .line 94
    .line 95
    new-instance v5, Ljava/lang/StringBuilder;

    .line 96
    .line 97
    invoke-direct {v5, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    invoke-static {v3, v1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    iget-object v1, p0, Lcom/immomo/moment/mediautils/p;->w:Ll/spw;

    .line 115
    .line 116
    if-eqz v1, :cond_2

    .line 117
    .line 118
    new-instance v3, Ljava/lang/StringBuilder;

    .line 119
    .line 120
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    invoke-interface {v1, v6, v0}, Ll/spw;->onFail(ILjava/lang/String;)V

    .line 135
    .line 136
    .line 137
    :cond_2
    :goto_1
    iput-object v7, p0, Lcom/immomo/moment/mediautils/p;->l:Ljava/lang/Thread;

    .line 138
    .line 139
    :cond_3
    iget-object v0, p0, Lcom/immomo/moment/mediautils/p;->d:Ll/d710;

    .line 140
    .line 141
    invoke-virtual {v0}, Ll/d710;->e()V

    .line 142
    .line 143
    .line 144
    iget-object v0, p0, Lcom/immomo/moment/mediautils/p;->e:Lcom/immomo/moment/mediautils/j;

    .line 145
    .line 146
    invoke-virtual {v0}, Lcom/immomo/moment/mediautils/j;->e()V

    .line 147
    .line 148
    .line 149
    iput-object v7, p0, Lcom/immomo/moment/mediautils/p;->d:Ll/d710;

    .line 150
    .line 151
    iput-object v7, p0, Lcom/immomo/moment/mediautils/p;->e:Lcom/immomo/moment/mediautils/j;

    .line 152
    .line 153
    const/4 v0, 0x0

    .line 154
    iput-boolean v0, p0, Lcom/immomo/moment/mediautils/p;->r:Z

    .line 155
    .line 156
    :cond_4
    monitor-exit v4

    .line 157
    return-void

    .line 158
    :goto_2
    monitor-exit v4
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 159
    throw p0
.end method

.method public p(Ll/spw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/p;->w:Ll/spw;

    .line 2
    .line 3
    return-void
.end method

.method public q(Ll/kpw;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/p;->j:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iput-object p1, p0, Lcom/immomo/moment/mediautils/p;->v:Ll/kpw;

    .line 5
    .line 6
    monitor-exit v0

    .line 7
    return-void

    .line 8
    :catchall_0
    move-exception p0

    .line 9
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    throw p0
.end method

.method public r(Ljava/util/List;Ljava/lang/String;)Z
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation

    .line 1
    const-string v0, "Get the video info failed when splice init !!! "

    .line 2
    .line 3
    const-string v1, "Get the video info failed when splice init !!! "

    .line 4
    .line 5
    iget-object v2, p0, Lcom/immomo/moment/mediautils/p;->j:Ljava/lang/Object;

    .line 6
    .line 7
    monitor-enter v2

    .line 8
    const/4 v3, 0x0

    .line 9
    if-eqz p1, :cond_10

    .line 10
    .line 11
    :try_start_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v4

    .line 15
    if-lez v4, :cond_10

    .line 16
    .line 17
    if-nez p2, :cond_0

    .line 18
    .line 19
    goto/16 :goto_6

    .line 20
    .line 21
    :cond_0
    iget-boolean v4, p0, Lcom/immomo/moment/mediautils/p;->r:Z

    .line 22
    .line 23
    const/4 v5, 0x1

    .line 24
    if-nez v4, :cond_f

    .line 25
    .line 26
    iput-object p1, p0, Lcom/immomo/moment/mediautils/p;->b:Ljava/util/List;

    .line 27
    .line 28
    iput-object p2, p0, Lcom/immomo/moment/mediautils/p;->c:Ljava/lang/String;

    .line 29
    .line 30
    invoke-direct {p0, p1}, Lcom/immomo/moment/mediautils/p;->n(Ljava/util/List;)Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-nez p1, :cond_1

    .line 35
    .line 36
    const-string p0, "Media_Splicing"

    .line 37
    .line 38
    const-string p1, "Check Splice media file list error !"

    .line 39
    .line 40
    invoke-static {p0, p1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    monitor-exit v2

    .line 44
    return v3

    .line 45
    :catchall_0
    move-exception p0

    .line 46
    goto/16 :goto_7

    .line 47
    .line 48
    :cond_1
    iget-object p1, p0, Lcom/immomo/moment/mediautils/p;->e:Lcom/immomo/moment/mediautils/j;

    .line 49
    .line 50
    const/4 p2, 0x0

    .line 51
    if-eqz p1, :cond_2

    .line 52
    .line 53
    invoke-virtual {p1}, Lcom/immomo/moment/mediautils/j;->e()V

    .line 54
    .line 55
    .line 56
    iput-object p2, p0, Lcom/immomo/moment/mediautils/p;->e:Lcom/immomo/moment/mediautils/j;

    .line 57
    .line 58
    :cond_2
    new-instance p1, Lcom/immomo/moment/mediautils/j;

    .line 59
    .line 60
    invoke-direct {p1}, Lcom/immomo/moment/mediautils/j;-><init>()V

    .line 61
    .line 62
    .line 63
    iput-object p1, p0, Lcom/immomo/moment/mediautils/p;->e:Lcom/immomo/moment/mediautils/j;

    .line 64
    .line 65
    new-instance v4, Lcom/immomo/moment/mediautils/p$a;

    .line 66
    .line 67
    invoke-direct {v4, p0}, Lcom/immomo/moment/mediautils/p$a;-><init>(Lcom/immomo/moment/mediautils/p;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p1, v4}, Lcom/immomo/moment/mediautils/f;->h(Lcom/immomo/moment/mediautils/f$a;)V

    .line 71
    .line 72
    .line 73
    iget-object p1, p0, Lcom/immomo/moment/mediautils/p;->e:Lcom/immomo/moment/mediautils/j;

    .line 74
    .line 75
    iget-object v4, p0, Lcom/immomo/moment/mediautils/p;->b:Ljava/util/List;

    .line 76
    .line 77
    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object v4

    .line 81
    check-cast v4, Ljava/lang/String;

    .line 82
    .line 83
    invoke-virtual {p1, v4}, Lcom/immomo/moment/mediautils/j;->c(Ljava/lang/String;)Z

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    if-nez p1, :cond_3

    .line 88
    .line 89
    const-string p0, "Media_Splicing"

    .line 90
    .line 91
    const-string p1, "init media demuxer failed !!!"

    .line 92
    .line 93
    invoke-static {p0, p1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 97
    return v3

    .line 98
    :cond_3
    const/16 p1, 0x3ec

    .line 99
    .line 100
    :try_start_1
    new-instance v4, Landroid/media/MediaMetadataRetriever;

    .line 101
    .line 102
    invoke-direct {v4}, Landroid/media/MediaMetadataRetriever;-><init>()V

    .line 103
    .line 104
    .line 105
    iget-object v6, p0, Lcom/immomo/moment/mediautils/p;->b:Ljava/util/List;

    .line 106
    .line 107
    invoke-interface {v6, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object v6

    .line 111
    check-cast v6, Ljava/lang/String;

    .line 112
    .line 113
    invoke-virtual {v4, v6}, Landroid/media/MediaMetadataRetriever;->setDataSource(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    const/16 v6, 0x18

    .line 117
    .line 118
    invoke-virtual {v4, v6}, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v6

    .line 122
    if-eqz v6, :cond_4

    .line 123
    .line 124
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    .line 125
    .line 126
    .line 127
    move-result v7

    .line 128
    if-lez v7, :cond_4

    .line 129
    .line 130
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    .line 131
    .line 132
    .line 133
    move-result-object v6

    .line 134
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    .line 135
    .line 136
    .line 137
    move-result v6
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 138
    goto :goto_0

    .line 139
    :catch_0
    move-exception v4

    .line 140
    move v6, v3

    .line 141
    goto :goto_1

    .line 142
    :cond_4
    move v6, v3

    .line 143
    :goto_0
    :try_start_2
    invoke-virtual {v4}, Landroid/media/MediaMetadataRetriever;->release()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 144
    .line 145
    .line 146
    goto :goto_2

    .line 147
    :catch_1
    move-exception v4

    .line 148
    :goto_1
    :try_start_3
    const-string v7, "Media_Splicing"

    .line 149
    .line 150
    new-instance v8, Ljava/lang/StringBuilder;

    .line 151
    .line 152
    invoke-direct {v8, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object v1

    .line 159
    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 160
    .line 161
    .line 162
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object v1

    .line 166
    invoke-static {v7, v1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 167
    .line 168
    .line 169
    iget-object v1, p0, Lcom/immomo/moment/mediautils/p;->w:Ll/spw;

    .line 170
    .line 171
    if-eqz v1, :cond_5

    .line 172
    .line 173
    new-instance v7, Ljava/lang/StringBuilder;

    .line 174
    .line 175
    invoke-direct {v7, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 176
    .line 177
    .line 178
    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 183
    .line 184
    .line 185
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object v0

    .line 189
    invoke-interface {v1, p1, v0}, Ll/spw;->onFail(ILjava/lang/String;)V

    .line 190
    .line 191
    .line 192
    :cond_5
    :goto_2
    iget-object v0, p0, Lcom/immomo/moment/mediautils/p;->e:Lcom/immomo/moment/mediautils/j;

    .line 193
    .line 194
    invoke-virtual {v0}, Lcom/immomo/moment/mediautils/j;->b()Ljava/util/List;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 199
    .line 200
    .line 201
    move-result v1

    .line 202
    if-gtz v1, :cond_6

    .line 203
    .line 204
    const-string p0, "Media_Splicing"

    .line 205
    .line 206
    const-string p1, "Invalid file type, no media info !!"

    .line 207
    .line 208
    invoke-static {p0, p1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 209
    .line 210
    .line 211
    monitor-exit v2

    .line 212
    return v3

    .line 213
    :cond_6
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 214
    .line 215
    .line 216
    move-result-object v1

    .line 217
    :cond_7
    :goto_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 218
    .line 219
    .line 220
    move-result v4

    .line 221
    const/4 v7, 0x2

    .line 222
    if-eqz v4, :cond_9

    .line 223
    .line 224
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 225
    .line 226
    .line 227
    move-result-object v4

    .line 228
    check-cast v4, Landroid/media/MediaFormat;

    .line 229
    .line 230
    const-string v8, "mime"

    .line 231
    .line 232
    invoke-virtual {v4, v8}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 233
    .line 234
    .line 235
    move-result-object v8

    .line 236
    const-string v9, "video"

    .line 237
    .line 238
    invoke-virtual {v8, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 239
    .line 240
    .line 241
    move-result v8

    .line 242
    if-eqz v8, :cond_8

    .line 243
    .line 244
    iget v4, p0, Lcom/immomo/moment/mediautils/p;->o:I

    .line 245
    .line 246
    or-int/2addr v4, v7

    .line 247
    iput v4, p0, Lcom/immomo/moment/mediautils/p;->o:I

    .line 248
    .line 249
    goto :goto_3

    .line 250
    :cond_8
    const-string v7, "mime"

    .line 251
    .line 252
    invoke-virtual {v4, v7}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 253
    .line 254
    .line 255
    move-result-object v4

    .line 256
    const-string v7, "audio"

    .line 257
    .line 258
    invoke-virtual {v4, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 259
    .line 260
    .line 261
    move-result v4

    .line 262
    if-eqz v4, :cond_7

    .line 263
    .line 264
    iget v4, p0, Lcom/immomo/moment/mediautils/p;->o:I

    .line 265
    .line 266
    or-int/2addr v4, v5

    .line 267
    iput v4, p0, Lcom/immomo/moment/mediautils/p;->o:I

    .line 268
    .line 269
    goto :goto_3

    .line 270
    :cond_9
    iget-object v1, p0, Lcom/immomo/moment/mediautils/p;->d:Ll/d710;

    .line 271
    .line 272
    if-eqz v1, :cond_a

    .line 273
    .line 274
    invoke-virtual {v1}, Ll/d710;->e()V

    .line 275
    .line 276
    .line 277
    iput-object p2, p0, Lcom/immomo/moment/mediautils/p;->d:Ll/d710;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 278
    .line 279
    :cond_a
    :try_start_4
    new-instance p2, Ll/d710;

    .line 280
    .line 281
    iget-object v1, p0, Lcom/immomo/moment/mediautils/p;->c:Ljava/lang/String;

    .line 282
    .line 283
    iget v4, p0, Lcom/immomo/moment/mediautils/p;->o:I

    .line 284
    .line 285
    invoke-direct {p2, v1, v4}, Ll/d710;-><init>(Ljava/lang/String;I)V

    .line 286
    .line 287
    .line 288
    iput-object p2, p0, Lcom/immomo/moment/mediautils/p;->d:Ll/d710;

    .line 289
    .line 290
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 291
    .line 292
    .line 293
    move-result-object p2

    .line 294
    :cond_b
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 295
    .line 296
    .line 297
    move-result v0

    .line 298
    if-eqz v0, :cond_f

    .line 299
    .line 300
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 301
    .line 302
    .line 303
    move-result-object v0

    .line 304
    check-cast v0, Landroid/media/MediaFormat;

    .line 305
    .line 306
    const-string v1, "mime"

    .line 307
    .line 308
    invoke-virtual {v0, v1}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 309
    .line 310
    .line 311
    move-result-object v1

    .line 312
    const-string v4, "video"

    .line 313
    .line 314
    invoke-virtual {v1, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 315
    .line 316
    .line 317
    move-result v1

    .line 318
    if-eqz v1, :cond_c

    .line 319
    .line 320
    iget-object v1, p0, Lcom/immomo/moment/mediautils/p;->d:Ll/d710;

    .line 321
    .line 322
    invoke-virtual {v1, v0, v7}, Ll/d710;->a(Landroid/media/MediaFormat;I)I

    .line 323
    .line 324
    .line 325
    move-result v1

    .line 326
    iput v1, p0, Lcom/immomo/moment/mediautils/p;->n:I

    .line 327
    .line 328
    if-eqz v6, :cond_d

    .line 329
    .line 330
    iget-object v1, p0, Lcom/immomo/moment/mediautils/p;->d:Ll/d710;

    .line 331
    .line 332
    invoke-virtual {v1, v6}, Ll/d710;->c(I)V

    .line 333
    .line 334
    .line 335
    goto :goto_4

    .line 336
    :catch_2
    move-exception p2

    .line 337
    goto :goto_5

    .line 338
    :cond_c
    const-string v1, "mime"

    .line 339
    .line 340
    invoke-virtual {v0, v1}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 341
    .line 342
    .line 343
    move-result-object v1

    .line 344
    const-string v4, "audio"

    .line 345
    .line 346
    invoke-virtual {v1, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 347
    .line 348
    .line 349
    move-result v1

    .line 350
    if-eqz v1, :cond_d

    .line 351
    .line 352
    iget-object v1, p0, Lcom/immomo/moment/mediautils/p;->d:Ll/d710;

    .line 353
    .line 354
    invoke-virtual {v1, v0, v5}, Ll/d710;->a(Landroid/media/MediaFormat;I)I

    .line 355
    .line 356
    .line 357
    move-result v1

    .line 358
    iput v1, p0, Lcom/immomo/moment/mediautils/p;->m:I

    .line 359
    .line 360
    :cond_d
    :goto_4
    iget-object v1, p0, Lcom/immomo/moment/mediautils/p;->e:Lcom/immomo/moment/mediautils/j;

    .line 361
    .line 362
    invoke-virtual {v1, v0}, Lcom/immomo/moment/mediautils/j;->g(Landroid/media/MediaFormat;)Z

    .line 363
    .line 364
    .line 365
    move-result v0
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 366
    if-nez v0, :cond_b

    .line 367
    .line 368
    :try_start_5
    monitor-exit v2

    .line 369
    return v3

    .line 370
    :goto_5
    const-string v0, "Media_Splicing"

    .line 371
    .line 372
    new-instance v1, Ljava/lang/StringBuilder;

    .line 373
    .line 374
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 375
    .line 376
    .line 377
    const-string v4, "Create muxer failed when splice init !!! "

    .line 378
    .line 379
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 380
    .line 381
    .line 382
    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 383
    .line 384
    .line 385
    move-result-object v4

    .line 386
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 387
    .line 388
    .line 389
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 390
    .line 391
    .line 392
    move-result-object v1

    .line 393
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 394
    .line 395
    .line 396
    iget-object p0, p0, Lcom/immomo/moment/mediautils/p;->w:Ll/spw;

    .line 397
    .line 398
    if-eqz p0, :cond_e

    .line 399
    .line 400
    new-instance v0, Ljava/lang/StringBuilder;

    .line 401
    .line 402
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 403
    .line 404
    .line 405
    const-string v1, "Create muxer failed when splice init !!! "

    .line 406
    .line 407
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 408
    .line 409
    .line 410
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 411
    .line 412
    .line 413
    move-result-object p2

    .line 414
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 415
    .line 416
    .line 417
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 418
    .line 419
    .line 420
    move-result-object p2

    .line 421
    invoke-interface {p0, p1, p2}, Ll/spw;->onFail(ILjava/lang/String;)V

    .line 422
    .line 423
    .line 424
    :cond_e
    monitor-exit v2

    .line 425
    return v3

    .line 426
    :cond_f
    monitor-exit v2

    .line 427
    return v5

    .line 428
    :cond_10
    :goto_6
    const-string p0, "Media_Splicing"

    .line 429
    .line 430
    const-string p1, "splicingList is null or the outpath is null !!!"

    .line 431
    .line 432
    invoke-static {p0, p1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 433
    .line 434
    .line 435
    monitor-exit v2

    .line 436
    return v3

    .line 437
    :goto_7
    monitor-exit v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 438
    throw p0
.end method

.method public s()V
    .locals 6

    .line 1
    const-string v0, "Muxing"

    .line 2
    .line 3
    const-string v1, "Splicing"

    .line 4
    .line 5
    iget-object v2, p0, Lcom/immomo/moment/mediautils/p;->j:Ljava/lang/Object;

    .line 6
    .line 7
    monitor-enter v2

    .line 8
    :try_start_0
    iget-object v3, p0, Lcom/immomo/moment/mediautils/p;->d:Ll/d710;

    .line 9
    .line 10
    if-eqz v3, :cond_0

    .line 11
    .line 12
    iget-object v4, p0, Lcom/immomo/moment/mediautils/p;->e:Lcom/immomo/moment/mediautils/j;

    .line 13
    .line 14
    if-eqz v4, :cond_0

    .line 15
    .line 16
    iget-boolean v4, p0, Lcom/immomo/moment/mediautils/p;->r:Z

    .line 17
    .line 18
    if-nez v4, :cond_0

    .line 19
    .line 20
    invoke-virtual {v3}, Ll/d710;->d()V

    .line 21
    .line 22
    .line 23
    new-instance v3, Ljava/lang/Thread;

    .line 24
    .line 25
    iget-object v4, p0, Lcom/immomo/moment/mediautils/p;->x:Ljava/lang/Runnable;

    .line 26
    .line 27
    new-instance v5, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    invoke-direct {v5, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-static {}, Ll/g8g0;->b()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-direct {v3, v4, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    iput-object v3, p0, Lcom/immomo/moment/mediautils/p;->k:Ljava/lang/Thread;

    .line 47
    .line 48
    new-instance v1, Ljava/lang/Thread;

    .line 49
    .line 50
    iget-object v3, p0, Lcom/immomo/moment/mediautils/p;->y:Ljava/lang/Runnable;

    .line 51
    .line 52
    new-instance v4, Ljava/lang/StringBuilder;

    .line 53
    .line 54
    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    invoke-static {}, Ll/g8g0;->b()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-direct {v1, v3, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    iput-object v1, p0, Lcom/immomo/moment/mediautils/p;->l:Ljava/lang/Thread;

    .line 72
    .line 73
    iget-object v0, p0, Lcom/immomo/moment/mediautils/p;->k:Ljava/lang/Thread;

    .line 74
    .line 75
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Lcom/immomo/moment/mediautils/p;->l:Ljava/lang/Thread;

    .line 79
    .line 80
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 81
    .line 82
    .line 83
    const/4 v0, 0x1

    .line 84
    iput-boolean v0, p0, Lcom/immomo/moment/mediautils/p;->r:Z

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :catchall_0
    move-exception p0

    .line 88
    goto :goto_1

    .line 89
    :cond_0
    :goto_0
    monitor-exit v2

    .line 90
    return-void

    .line 91
    :goto_1
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 92
    throw p0
.end method
