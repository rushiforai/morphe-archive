.class public abstract Ll/eli0;
.super Ll/qt2;
.source "SourceFile"


# static fields
.field public static A:I = 0x4

.field public static x:I = 0x1

.field public static y:I = 0x2

.field public static z:I = 0x3


# instance fields
.field private f:Ljava/lang/String;

.field protected g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/eli0;",
            ">;"
        }
    .end annotation
.end field

.field protected h:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Object;",
            "Ll/kt2;",
            ">;"
        }
    .end annotation
.end field

.field protected i:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Object;",
            "Ll/uje;",
            ">;"
        }
    .end annotation
.end field

.field protected j:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Lcom/immomo/components/interfaces/IProcessOutput;",
            ">;"
        }
    .end annotation
.end field

.field protected k:Ll/uje;

.field private l:Ll/uje;

.field m:Ll/bkm;

.field private n:Lcom/immomo/components/interfaces/IProcessOutput;

.field private volatile o:Z

.field private p:Ll/pmq0;

.field public q:Ll/rpr;

.field public r:Ll/qpr;

.field private s:J

.field protected t:Ll/tpr;

.field public u:Z

.field private v:Ll/spw;

.field private w:Ljava/nio/ByteBuffer;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Ll/qt2;-><init>(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    const-string p1, "TargetRenderThread"

    .line 5
    .line 6
    iput-object p1, p0, Ll/eli0;->f:Ljava/lang/String;

    .line 7
    .line 8
    new-instance p1, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Ll/eli0;->g:Ljava/util/List;

    .line 14
    .line 15
    new-instance p1, Ljava/util/HashMap;

    .line 16
    .line 17
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Ll/eli0;->h:Ljava/util/Map;

    .line 21
    .line 22
    new-instance p1, Ljava/util/HashMap;

    .line 23
    .line 24
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object p1, p0, Ll/eli0;->i:Ljava/util/Map;

    .line 28
    .line 29
    new-instance p1, Ljava/util/LinkedList;

    .line 30
    .line 31
    invoke-direct {p1}, Ljava/util/LinkedList;-><init>()V

    .line 32
    .line 33
    .line 34
    iput-object p1, p0, Ll/eli0;->j:Ljava/util/LinkedList;

    .line 35
    .line 36
    const/4 p1, 0x0

    .line 37
    iput-boolean p1, p0, Ll/eli0;->o:Z

    .line 38
    .line 39
    const/4 v0, 0x0

    .line 40
    iput-object v0, p0, Ll/eli0;->p:Ll/pmq0;

    .line 41
    .line 42
    iput-object v0, p0, Ll/eli0;->q:Ll/rpr;

    .line 43
    .line 44
    iput-object v0, p0, Ll/eli0;->r:Ll/qpr;

    .line 45
    .line 46
    const-wide/16 v0, -0x1

    .line 47
    .line 48
    iput-wide v0, p0, Ll/eli0;->s:J

    .line 49
    .line 50
    iput-boolean p1, p0, Ll/eli0;->u:Z

    .line 51
    .line 52
    return-void
.end method

.method public static synthetic W(Ll/eli0;)Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/eli0;->w:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic X(Ll/eli0;Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/eli0;->w:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic Y(Ll/eli0;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/eli0;->s:J

    .line 2
    .line 3
    return-wide v0
.end method

.method private d0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/eli0;->p:Ll/pmq0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Ll/eli0;->m:Ll/bkm;

    .line 6
    .line 7
    invoke-virtual {v1, v0}, Ll/bkm;->r(Ll/kt2;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/eli0;->p:Ll/pmq0;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/pmq0;->f()V

    .line 13
    .line 14
    .line 15
    :cond_0
    new-instance v0, Ll/pmq0;

    .line 16
    .line 17
    invoke-direct {v0}, Ll/pmq0;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Ll/eli0;->p:Ll/pmq0;

    .line 21
    .line 22
    new-instance v1, Ll/eli0$a;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/eli0$a;-><init>(Ll/eli0;)V

    .line 25
    .line 26
    .line 27
    iput-object v1, v0, Ll/pmq0;->D:Ll/pmq0$a;

    .line 28
    .line 29
    iget-object v0, p0, Ll/eli0;->m:Ll/bkm;

    .line 30
    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    iget-object p0, p0, Ll/eli0;->p:Ll/pmq0;

    .line 34
    .line 35
    invoke-virtual {v0, p0}, Ll/bkm;->h(Ll/kt2;)V

    .line 36
    .line 37
    .line 38
    :cond_1
    return-void
.end method

.method private i0()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/eli0;->o:Z

    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public A0(Ljava/lang/Object;Ll/kt2;)V
    .locals 1

    .line 1
    sget v0, Ll/eli0;->x:I

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0, p2}, Ll/eli0;->B0(Ljava/lang/Object;ILl/kt2;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public B0(Ljava/lang/Object;ILl/kt2;)V
    .locals 0

    .line 1
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    filled-new-array {p1, p2, p3}, [Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Ll/qt2;->Q(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public C0(Ll/bkm;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/eli0;->m:Ll/bkm;

    .line 2
    .line 3
    return-void
.end method

.method public D0(Ljava/lang/Object;Ll/kt2;)V
    .locals 1

    .line 1
    sget v0, Ll/eli0;->A:I

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0, p2}, Ll/eli0;->B0(Ljava/lang/Object;ILl/kt2;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public E0(Ljava/lang/Object;Ll/kt2;)V
    .locals 1

    .line 1
    sget v0, Ll/eli0;->y:I

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0, p2}, Ll/eli0;->B0(Ljava/lang/Object;ILl/kt2;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public F0(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/eli0;->s:J

    .line 2
    .line 3
    return-void
.end method

.method public G()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/eli0;->i0()V

    .line 2
    .line 3
    .line 4
    invoke-super {p0}, Ll/qt2;->G()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public P()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/eli0;->i0()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/eli0;->g:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Ll/eli0;

    .line 21
    .line 22
    invoke-virtual {v1}, Ll/eli0;->P()V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    invoke-super {p0}, Ll/qt2;->P()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public Z(Ljava/lang/Object;)V
    .locals 1

    .line 1
    sget v0, Ll/eli0;->x:I

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0}, Ll/eli0;->b0(Ljava/lang/Object;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public a0(Ljava/lang/Object;)V
    .locals 1

    .line 1
    sget v0, Ll/eli0;->y:I

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0}, Ll/eli0;->b0(Ljava/lang/Object;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b(Ll/kt2;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/qt2;->b(Ll/kt2;)V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    iget-object p0, p0, Ll/eli0;->m:Ll/bkm;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ll/bkm;->a(Ll/kt2;)V

    .line 11
    .line 12
    .line 13
    new-instance p0, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string v0, "handle add filter to destory "

    .line 16
    .line 17
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const-string p1, "mediaRender"

    .line 32
    .line 33
    invoke-static {p1, p0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method public b0(Ljava/lang/Object;I)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Ll/eli0;->c0(Ljava/lang/Object;IZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public c(Ljava/lang/Object;IZ)V
    .locals 9

    .line 1
    const-string v0, "handleAddTarget !!!"

    .line 2
    .line 3
    const-string v1, "mediaRender"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget v0, Ll/eli0;->z:I

    .line 9
    .line 10
    if-ne p2, v0, :cond_0

    .line 11
    .line 12
    invoke-direct {p0}, Ll/eli0;->d0()V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-virtual {p0, p1}, Ll/eli0;->o(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    new-instance v0, Ll/uje;

    .line 20
    .line 21
    invoke-direct {v0}, Ll/uje;-><init>()V

    .line 22
    .line 23
    .line 24
    instance-of v2, p1, Ll/eli0;

    .line 25
    .line 26
    const/16 v3, 0x1b59

    .line 27
    .line 28
    const/4 v4, 0x1

    .line 29
    if-eqz v2, :cond_2

    .line 30
    .line 31
    move-object v5, p1

    .line 32
    check-cast v5, Ll/eli0;

    .line 33
    .line 34
    invoke-virtual {v5}, Ll/eli0;->j0()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v6

    .line 38
    if-nez v6, :cond_1

    .line 39
    .line 40
    const-string p1, "Get TargetRenderThread input surface is null"

    .line 41
    .line 42
    invoke-static {v1, p1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    iget-object p1, p0, Ll/qt2;->d:Ll/spr;

    .line 46
    .line 47
    if-eqz p1, :cond_9

    .line 48
    .line 49
    iget-object p2, p0, Ll/eli0;->f:Ljava/lang/String;

    .line 50
    .line 51
    const-string p3, "Get target input surfae is null !"

    .line 52
    .line 53
    invoke-interface {p1, p2, v4, p3}, Ll/spr;->e(Ljava/lang/String;ILjava/lang/String;)V

    .line 54
    .line 55
    .line 56
    iget-object p0, p0, Ll/eli0;->v:Ll/spw;

    .line 57
    .line 58
    if-eqz p0, :cond_9

    .line 59
    .line 60
    invoke-interface {p0, v3, p3}, Ll/spw;->onFail(ILjava/lang/String;)V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_1
    invoke-virtual {v5, v0}, Ll/eli0;->w0(Ll/uje;)V

    .line 65
    .line 66
    .line 67
    iget-object v7, p0, Ll/eli0;->g:Ljava/util/List;

    .line 68
    .line 69
    invoke-interface {v7, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_2
    move-object v6, p1

    .line 74
    :goto_0
    :try_start_0
    sget v5, Ll/eli0;->x:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 75
    .line 76
    iget-object v7, p0, Ll/eli0;->k:Ll/uje;

    .line 77
    .line 78
    const/4 v8, 0x0

    .line 79
    if-ne p2, v5, :cond_4

    .line 80
    .line 81
    if-nez v7, :cond_3

    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_3
    :try_start_1
    iget-object v8, v7, Ll/uje;->c:Landroid/opengl/EGLContext;

    .line 85
    .line 86
    :goto_1
    invoke-virtual {v0, v8, v6}, Ll/uje;->c(Landroid/opengl/EGLContext;Ljava/lang/Object;)V

    .line 87
    .line 88
    .line 89
    goto :goto_3

    .line 90
    :catch_0
    move-exception p2

    .line 91
    goto :goto_4

    .line 92
    :cond_4
    if-nez v7, :cond_5

    .line 93
    .line 94
    goto :goto_2

    .line 95
    :cond_5
    iget-object v8, v7, Ll/uje;->c:Landroid/opengl/EGLContext;

    .line 96
    .line 97
    :goto_2
    invoke-virtual {v0, v8, v6}, Ll/uje;->e(Landroid/opengl/EGLContext;Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 98
    .line 99
    .line 100
    :goto_3
    iget-object p2, p0, Ll/eli0;->i:Ljava/util/Map;

    .line 101
    .line 102
    invoke-interface {p2, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    if-eqz p3, :cond_9

    .line 106
    .line 107
    new-instance p2, Ll/lqi0;

    .line 108
    .line 109
    invoke-direct {p2}, Ll/lqi0;-><init>()V

    .line 110
    .line 111
    .line 112
    iget-object p3, p0, Ll/eli0;->k:Ll/uje;

    .line 113
    .line 114
    invoke-virtual {p2, v0, p3}, Ll/lqi0;->a(Ll/uje;Ll/uje;)V

    .line 115
    .line 116
    .line 117
    iget-object p3, p0, Ll/eli0;->m:Ll/bkm;

    .line 118
    .line 119
    if-eqz p3, :cond_6

    .line 120
    .line 121
    invoke-virtual {p3, p2}, Ll/bkm;->h(Ll/kt2;)V

    .line 122
    .line 123
    .line 124
    :cond_6
    iget-object p0, p0, Ll/eli0;->h:Ljava/util/Map;

    .line 125
    .line 126
    invoke-interface {p0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    return-void

    .line 130
    :goto_4
    const-string p3, "Create egl devices failed ! Add Target failed !"

    .line 131
    .line 132
    invoke-static {v1, p3}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    invoke-static {v1, p2}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 136
    .line 137
    .line 138
    if-eqz v2, :cond_7

    .line 139
    .line 140
    iget-object p3, p0, Ll/eli0;->g:Ljava/util/List;

    .line 141
    .line 142
    invoke-interface {p3, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 143
    .line 144
    .line 145
    :cond_7
    iget-object p1, p0, Ll/qt2;->d:Ll/spr;

    .line 146
    .line 147
    const-string p3, "Create target Egl device has exception !"

    .line 148
    .line 149
    if-eqz p1, :cond_8

    .line 150
    .line 151
    iget-object v0, p0, Ll/eli0;->f:Ljava/lang/String;

    .line 152
    .line 153
    invoke-interface {p1, v0, v4, p3}, Ll/spr;->e(Ljava/lang/String;ILjava/lang/String;)V

    .line 154
    .line 155
    .line 156
    :cond_8
    iget-object p0, p0, Ll/eli0;->v:Ll/spw;

    .line 157
    .line 158
    if-eqz p0, :cond_9

    .line 159
    .line 160
    new-instance p1, Ljava/lang/StringBuilder;

    .line 161
    .line 162
    invoke-direct {p1, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 163
    .line 164
    .line 165
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object p2

    .line 169
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object p1

    .line 176
    invoke-interface {p0, v3, p1}, Ll/spw;->onFail(ILjava/lang/String;)V

    .line 177
    .line 178
    .line 179
    :cond_9
    return-void
.end method

.method public c0(Ljava/lang/Object;IZ)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p3

    .line 11
    filled-new-array {p1, p2, p3}, [Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Ll/qt2;->A(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public d()V
    .locals 3

    .line 1
    const-string v0, "mediaRender"

    .line 2
    .line 3
    const-string v1, "Handle clear all target !"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-super {p0}, Ll/qt2;->d()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/eli0;->i:Ljava/util/Map;

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_1

    .line 26
    .line 27
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    check-cast v1, Ll/uje;

    .line 32
    .line 33
    if-eqz v1, :cond_0

    .line 34
    .line 35
    invoke-virtual {v1}, Ll/uje;->g()V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    iget-object v0, p0, Ll/eli0;->p:Ll/pmq0;

    .line 40
    .line 41
    if-eqz v0, :cond_2

    .line 42
    .line 43
    iget-object v1, p0, Ll/eli0;->m:Ll/bkm;

    .line 44
    .line 45
    invoke-virtual {v1, v0}, Ll/bkm;->r(Ll/kt2;)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Ll/eli0;->p:Ll/pmq0;

    .line 49
    .line 50
    invoke-virtual {v0}, Ll/pmq0;->f()V

    .line 51
    .line 52
    .line 53
    const/4 v0, 0x0

    .line 54
    iput-object v0, p0, Ll/eli0;->p:Ll/pmq0;

    .line 55
    .line 56
    :cond_2
    iget-object v0, p0, Ll/eli0;->i:Ljava/util/Map;

    .line 57
    .line 58
    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Ll/eli0;->h:Ljava/util/Map;

    .line 62
    .line 63
    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    if-eqz v1, :cond_3

    .line 76
    .line 77
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    check-cast v1, Ll/kt2;

    .line 82
    .line 83
    iget-object v2, p0, Ll/eli0;->m:Ll/bkm;

    .line 84
    .line 85
    invoke-virtual {v2, v1}, Ll/bkm;->r(Ll/kt2;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v1}, Ll/hfj;->f()V

    .line 89
    .line 90
    .line 91
    goto :goto_1

    .line 92
    :cond_3
    iget-object v0, p0, Ll/eli0;->h:Ljava/util/Map;

    .line 93
    .line 94
    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 95
    .line 96
    .line 97
    iget-object v0, p0, Ll/eli0;->g:Ljava/util/List;

    .line 98
    .line 99
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 104
    .line 105
    .line 106
    move-result v1

    .line 107
    if-eqz v1, :cond_4

    .line 108
    .line 109
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    check-cast v1, Ll/eli0;

    .line 114
    .line 115
    invoke-virtual {v1}, Ll/eli0;->G()V

    .line 116
    .line 117
    .line 118
    goto :goto_2

    .line 119
    :cond_4
    iget-object p0, p0, Ll/eli0;->g:Ljava/util/List;

    .line 120
    .line 121
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 122
    .line 123
    .line 124
    return-void
.end method

.method public e0()V
    .locals 1

    .line 1
    sget v0, Ll/eli0;->z:I

    .line 2
    .line 3
    invoke-virtual {p0, p0, v0}, Ll/eli0;->b0(Ljava/lang/Object;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public f0()V
    .locals 0

    .line 1
    return-void
.end method

.method public g()V
    .locals 2

    .line 1
    const-string v0, "mediaRender"

    .line 2
    .line 3
    const-string v1, "handleInitDumyScreen !!!"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/eli0;->k:Ll/uje;

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    new-instance v0, Ll/uje;

    .line 13
    .line 14
    invoke-direct {v0}, Ll/uje;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/eli0;->k:Ll/uje;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/uje;->a()V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Ll/eli0;->k:Ll/uje;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/uje;->f()Z

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public g0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/eli0;->q:Ll/rpr;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/rpr;->a()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public h0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/eli0;->q:Ll/rpr;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ll/rpr;->b()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/eli0;->m:Ll/bkm;

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    check-cast v0, Lcom/immomo/components/interfaces/IProcessOutput;

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ll/bkm;->s(Lcom/immomo/components/interfaces/IProcessOutput;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public i()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/eli0;->t:Ll/tpr;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/tpr;->onPause()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public j()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/eli0;->t:Ll/tpr;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/tpr;->onResume()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public j0()Ljava/lang/Object;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public k()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/eli0;->j:Ljava/util/LinkedList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/eli0;->j:Ljava/util/LinkedList;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/util/LinkedList;->pollFirst()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lcom/immomo/components/interfaces/IProcessOutput;

    .line 16
    .line 17
    iput-object v0, p0, Ll/eli0;->n:Lcom/immomo/components/interfaces/IProcessOutput;

    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public k0(Ll/izc0;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/izc0;->a()Ll/crf0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Ll/eli0;->h:Ljava/util/Map;

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/izc0;->b()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ll/kt2;

    .line 16
    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    new-instance p1, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    const-string v1, "input render filterSize  = "

    .line 22
    .line 23
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Ll/crf0;->b()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    const-string v1, "mediaRender"

    .line 38
    .line 39
    invoke-static {v1, p1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0}, Ll/crf0;->b()I

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    invoke-virtual {v0}, Ll/crf0;->a()I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    invoke-virtual {p0, p1, v0}, Ll/xej;->z(II)V

    .line 51
    .line 52
    .line 53
    :cond_0
    return-void
.end method

.method public l0(Ll/crf0;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/eli0;->p:Ll/pmq0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/crf0;->b()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-virtual {p1}, Ll/crf0;->a()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    invoke-virtual {p0, v0, p1}, Ll/xej;->z(II)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public m()V
    .locals 3

    .line 1
    const-string v0, "mediaRender"

    .line 2
    .line 3
    const-string v1, "handleReleaseAll !!!"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-super {p0}, Ll/qt2;->m()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/eli0;->m:Ll/bkm;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/bkm;->i()V

    .line 17
    .line 18
    .line 19
    iput-object v1, p0, Ll/eli0;->m:Ll/bkm;

    .line 20
    .line 21
    :cond_0
    iget-object v0, p0, Ll/eli0;->i:Ljava/util/Map;

    .line 22
    .line 23
    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    if-eqz v2, :cond_2

    .line 36
    .line 37
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    check-cast v2, Ll/uje;

    .line 42
    .line 43
    if-eqz v2, :cond_1

    .line 44
    .line 45
    invoke-virtual {v2}, Ll/uje;->g()V

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_2
    iget-object v0, p0, Ll/eli0;->i:Ljava/util/Map;

    .line 50
    .line 51
    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Ll/eli0;->p:Ll/pmq0;

    .line 55
    .line 56
    if-eqz v0, :cond_3

    .line 57
    .line 58
    invoke-virtual {v0}, Ll/pmq0;->f()V

    .line 59
    .line 60
    .line 61
    iput-object v1, p0, Ll/eli0;->p:Ll/pmq0;

    .line 62
    .line 63
    :cond_3
    iget-object v0, p0, Ll/eli0;->h:Ljava/util/Map;

    .line 64
    .line 65
    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 74
    .line 75
    .line 76
    move-result v2

    .line 77
    if-eqz v2, :cond_4

    .line 78
    .line 79
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    check-cast v2, Ll/kt2;

    .line 84
    .line 85
    invoke-virtual {v2}, Ll/hfj;->f()V

    .line 86
    .line 87
    .line 88
    goto :goto_1

    .line 89
    :cond_4
    iget-object v0, p0, Ll/eli0;->h:Ljava/util/Map;

    .line 90
    .line 91
    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 92
    .line 93
    .line 94
    iget-object v0, p0, Ll/eli0;->g:Ljava/util/List;

    .line 95
    .line 96
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 101
    .line 102
    .line 103
    move-result v2

    .line 104
    if-eqz v2, :cond_5

    .line 105
    .line 106
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object v2

    .line 110
    check-cast v2, Ll/eli0;

    .line 111
    .line 112
    invoke-virtual {v2}, Ll/eli0;->G()V

    .line 113
    .line 114
    .line 115
    goto :goto_2

    .line 116
    :cond_5
    iget-object v0, p0, Ll/eli0;->g:Ljava/util/List;

    .line 117
    .line 118
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 119
    .line 120
    .line 121
    iget-object v0, p0, Ll/eli0;->k:Ll/uje;

    .line 122
    .line 123
    if-eqz v0, :cond_6

    .line 124
    .line 125
    invoke-virtual {v0}, Ll/uje;->g()V

    .line 126
    .line 127
    .line 128
    iput-object v1, p0, Ll/eli0;->k:Ll/uje;

    .line 129
    .line 130
    :cond_6
    invoke-virtual {p0}, Ll/qt2;->a()V

    .line 131
    .line 132
    .line 133
    invoke-virtual {p0}, Ll/qt2;->U()V

    .line 134
    .line 135
    .line 136
    return-void
.end method

.method public m0(I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/eli0;->o0(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public n(Ljava/lang/Object;I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/eli0;->h:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/kt2;

    .line 8
    .line 9
    if-eqz v0, :cond_2

    .line 10
    .line 11
    sget v1, Ll/eli0;->x:I

    .line 12
    .line 13
    if-ne p2, v1, :cond_0

    .line 14
    .line 15
    iget-object v1, p0, Ll/eli0;->m:Ll/bkm;

    .line 16
    .line 17
    invoke-virtual {v1, v0}, Ll/bkm;->r(Ll/kt2;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    sget v1, Ll/eli0;->A:I

    .line 21
    .line 22
    if-ne p2, v1, :cond_1

    .line 23
    .line 24
    iget-object p2, p0, Ll/eli0;->m:Ll/bkm;

    .line 25
    .line 26
    invoke-virtual {p2, v0}, Ll/bkm;->q(Ll/kt2;)V

    .line 27
    .line 28
    .line 29
    :cond_1
    invoke-virtual {v0}, Ll/hfj;->f()V

    .line 30
    .line 31
    .line 32
    iget-object p2, p0, Ll/eli0;->h:Ljava/util/Map;

    .line 33
    .line 34
    invoke-interface {p2, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    :cond_2
    iget-object p2, p0, Ll/eli0;->i:Ljava/util/Map;

    .line 38
    .line 39
    invoke-interface {p2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    check-cast p2, Ll/uje;

    .line 44
    .line 45
    if-eqz p2, :cond_3

    .line 46
    .line 47
    invoke-virtual {p2}, Ll/uje;->g()V

    .line 48
    .line 49
    .line 50
    iget-object p0, p0, Ll/eli0;->i:Ljava/util/Map;

    .line 51
    .line 52
    invoke-interface {p0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    :cond_3
    return-void
.end method

.method public n0(ILjava/lang/Object;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/eli0;->q0(ILjava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public o(Ljava/lang/Object;)V
    .locals 2

    .line 1
    const-string v0, "mediaRender"

    .line 2
    .line 3
    const-string v1, "handleRemoveTarget"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    instance-of v0, p1, Ll/eli0;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Ll/eli0;->g:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Ll/eli0;->h:Ljava/util/Map;

    .line 18
    .line 19
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Ll/kt2;

    .line 24
    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    iget-object v1, p0, Ll/eli0;->m:Ll/bkm;

    .line 28
    .line 29
    invoke-virtual {v1, v0}, Ll/bkm;->r(Ll/kt2;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0}, Ll/hfj;->f()V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ll/eli0;->h:Ljava/util/Map;

    .line 36
    .line 37
    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    :cond_1
    iget-object v0, p0, Ll/eli0;->i:Ljava/util/Map;

    .line 41
    .line 42
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    check-cast v0, Ll/uje;

    .line 47
    .line 48
    if-eqz v0, :cond_2

    .line 49
    .line 50
    invoke-virtual {v0}, Ll/uje;->g()V

    .line 51
    .line 52
    .line 53
    iget-object p0, p0, Ll/eli0;->i:Ljava/util/Map;

    .line 54
    .line 55
    invoke-interface {p0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    :cond_2
    return-void
.end method

.method public o0(I)V
    .locals 1

    .line 1
    new-instance v0, Landroid/os/Message;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 4
    .line 5
    .line 6
    iput p1, v0, Landroid/os/Message;->what:I

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/qt2;->K(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public p()V
    .locals 6

    .line 1
    invoke-virtual {p0}, Ll/eli0;->h0()V

    .line 2
    .line 3
    .line 4
    :try_start_0
    iget-object v0, p0, Ll/eli0;->k:Ll/uje;

    .line 5
    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    iget-boolean v0, p0, Ll/eli0;->o:Z

    .line 9
    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 13
    .line 14
    .line 15
    move-result-wide v0

    .line 16
    iget-wide v2, p0, Ll/eli0;->s:J

    .line 17
    .line 18
    const-wide/16 v4, 0x0

    .line 19
    .line 20
    cmp-long v4, v2, v4

    .line 21
    .line 22
    if-ltz v4, :cond_0

    .line 23
    .line 24
    move-wide v0, v2

    .line 25
    :cond_0
    iget-object v2, p0, Ll/eli0;->m:Ll/bkm;

    .line 26
    .line 27
    invoke-virtual {v2, v0, v1}, Ll/bkm;->p(J)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/eli0;->k:Ll/uje;

    .line 31
    .line 32
    invoke-virtual {v0}, Ll/uje;->f()Z

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Ll/eli0;->f0()V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Ll/eli0;->m:Ll/bkm;

    .line 39
    .line 40
    invoke-virtual {v0}, Ll/bkm;->c()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :catch_0
    move-exception v0

    .line 45
    new-instance v1, Ljava/lang/StringBuilder;

    .line 46
    .line 47
    const-string v2, "Rending Target Error !!!"

    .line 48
    .line 49
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    const-string v3, "mediaRender"

    .line 64
    .line 65
    invoke-static {v3, v1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    iget-object v1, p0, Ll/eli0;->v:Ll/spw;

    .line 69
    .line 70
    if-eqz v1, :cond_1

    .line 71
    .line 72
    new-instance v3, Ljava/lang/StringBuilder;

    .line 73
    .line 74
    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    const/16 v2, 0x1b5a

    .line 89
    .line 90
    invoke-interface {v1, v2, v0}, Ll/spw;->onFail(ILjava/lang/String;)V

    .line 91
    .line 92
    .line 93
    :cond_1
    :goto_0
    invoke-virtual {p0}, Ll/eli0;->g0()V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public p0(II)V
    .locals 1

    .line 1
    new-instance v0, Landroid/os/Message;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 4
    .line 5
    .line 6
    iput p1, v0, Landroid/os/Message;->what:I

    .line 7
    .line 8
    iput p2, v0, Landroid/os/Message;->arg1:I

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ll/qt2;->K(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public q0(ILjava/lang/Object;)V
    .locals 1

    .line 1
    new-instance v0, Landroid/os/Message;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 4
    .line 5
    .line 6
    iput p1, v0, Landroid/os/Message;->what:I

    .line 7
    .line 8
    iput-object p2, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ll/qt2;->K(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public r0(ILjava/lang/Object;)V
    .locals 1

    .line 1
    new-instance v0, Landroid/os/Message;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 4
    .line 5
    .line 6
    iput p1, v0, Landroid/os/Message;->what:I

    .line 7
    .line 8
    iput-object p2, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ll/qt2;->K(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public s()V
    .locals 3

    .line 1
    const-string v0, "mediaRender"

    .line 2
    .line 3
    const-string v1, "handleStartRender !!!"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Ll/eli0;->o:Z

    .line 10
    .line 11
    iget-object v0, p0, Ll/eli0;->h:Ljava/util/Map;

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_1

    .line 26
    .line 27
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    check-cast v1, Ll/kt2;

    .line 32
    .line 33
    iget-object v2, p0, Ll/eli0;->m:Ll/bkm;

    .line 34
    .line 35
    if-eqz v2, :cond_0

    .line 36
    .line 37
    invoke-virtual {v2, v1}, Ll/bkm;->h(Ll/kt2;)V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    iget-object v0, p0, Ll/eli0;->p:Ll/pmq0;

    .line 42
    .line 43
    if-eqz v0, :cond_2

    .line 44
    .line 45
    iget-object p0, p0, Ll/eli0;->m:Ll/bkm;

    .line 46
    .line 47
    invoke-virtual {p0, v0}, Ll/bkm;->h(Ll/kt2;)V

    .line 48
    .line 49
    .line 50
    :cond_2
    return-void
.end method

.method public s0()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/qt2;->I()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public t0(Ll/spw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/eli0;->v:Ll/spw;

    .line 2
    .line 3
    return-void
.end method

.method public u0(Ll/rpr;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/eli0;->q:Ll/rpr;

    .line 2
    .line 3
    return-void
.end method

.method public v(Ljava/lang/Object;ILl/kt2;)V
    .locals 6

    .line 1
    const-string v0, "handle update end point filter !!!"

    .line 2
    .line 3
    const-string v1, "mediaRender"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    if-eqz p1, :cond_c

    .line 9
    .line 10
    if-eqz p3, :cond_c

    .line 11
    .line 12
    iget-object v0, p0, Ll/eli0;->h:Ljava/util/Map;

    .line 13
    .line 14
    if-eqz v0, :cond_c

    .line 15
    .line 16
    iget-object v2, p0, Ll/eli0;->i:Ljava/util/Map;

    .line 17
    .line 18
    if-eqz v2, :cond_c

    .line 19
    .line 20
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Ll/kt2;

    .line 25
    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    iget-object v2, p0, Ll/eli0;->m:Ll/bkm;

    .line 29
    .line 30
    if-eqz v2, :cond_0

    .line 31
    .line 32
    invoke-virtual {v2, v0}, Ll/bkm;->r(Ll/kt2;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    invoke-virtual {v0}, Ll/hfj;->f()V

    .line 36
    .line 37
    .line 38
    :cond_1
    iget-object v0, p0, Ll/eli0;->i:Ljava/util/Map;

    .line 39
    .line 40
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    check-cast v0, Ll/uje;

    .line 45
    .line 46
    if-nez v0, :cond_8

    .line 47
    .line 48
    new-instance v0, Ll/uje;

    .line 49
    .line 50
    invoke-direct {v0}, Ll/uje;-><init>()V

    .line 51
    .line 52
    .line 53
    instance-of v2, p1, Ll/eli0;

    .line 54
    .line 55
    if-eqz v2, :cond_2

    .line 56
    .line 57
    move-object v3, p1

    .line 58
    check-cast v3, Ll/eli0;

    .line 59
    .line 60
    invoke-virtual {v3}, Ll/eli0;->j0()Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v4

    .line 64
    invoke-virtual {v3, v0}, Ll/eli0;->w0(Ll/uje;)V

    .line 65
    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_2
    move-object v4, p1

    .line 69
    :goto_0
    :try_start_0
    sget v3, Ll/eli0;->x:I

    .line 70
    .line 71
    const/4 v5, 0x0

    .line 72
    if-eq p2, v3, :cond_5

    .line 73
    .line 74
    sget v3, Ll/eli0;->A:I

    .line 75
    .line 76
    if-ne p2, v3, :cond_3

    .line 77
    .line 78
    goto :goto_2

    .line 79
    :cond_3
    iget-object v3, p0, Ll/eli0;->k:Ll/uje;

    .line 80
    .line 81
    if-nez v3, :cond_4

    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_4
    iget-object v5, v3, Ll/uje;->c:Landroid/opengl/EGLContext;

    .line 85
    .line 86
    :goto_1
    invoke-virtual {v0, v5, v4}, Ll/uje;->e(Landroid/opengl/EGLContext;Ljava/lang/Object;)V

    .line 87
    .line 88
    .line 89
    goto :goto_5

    .line 90
    :catch_0
    move-exception p1

    .line 91
    goto :goto_4

    .line 92
    :cond_5
    :goto_2
    iget-object v3, p0, Ll/eli0;->k:Ll/uje;

    .line 93
    .line 94
    if-nez v3, :cond_6

    .line 95
    .line 96
    goto :goto_3

    .line 97
    :cond_6
    iget-object v5, v3, Ll/uje;->c:Landroid/opengl/EGLContext;

    .line 98
    .line 99
    :goto_3
    invoke-virtual {v0, v5, v4}, Ll/uje;->c(Landroid/opengl/EGLContext;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 100
    .line 101
    .line 102
    goto :goto_5

    .line 103
    :goto_4
    const-string p3, "Create egl devices failed ! Add Target failed !"

    .line 104
    .line 105
    invoke-static {v1, p3}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    invoke-static {v1, p1}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 109
    .line 110
    .line 111
    if-eqz v2, :cond_7

    .line 112
    .line 113
    iget-object p1, p0, Ll/eli0;->g:Ljava/util/List;

    .line 114
    .line 115
    invoke-interface {p1, p2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    :cond_7
    iget-object p1, p0, Ll/qt2;->d:Ll/spr;

    .line 119
    .line 120
    if-eqz p1, :cond_c

    .line 121
    .line 122
    iget-object p0, p0, Ll/eli0;->f:Ljava/lang/String;

    .line 123
    .line 124
    const/4 p2, 0x1

    .line 125
    const-string p3, "Create target Egl device has exception !"

    .line 126
    .line 127
    invoke-interface {p1, p0, p2, p3}, Ll/spr;->e(Ljava/lang/String;ILjava/lang/String;)V

    .line 128
    .line 129
    .line 130
    goto :goto_6

    .line 131
    :cond_8
    :goto_5
    instance-of v1, p3, Ll/gzc0;

    .line 132
    .line 133
    if-eqz v1, :cond_9

    .line 134
    .line 135
    move-object v1, p3

    .line 136
    check-cast v1, Ll/gzc0;

    .line 137
    .line 138
    iget-object v2, p0, Ll/eli0;->k:Ll/uje;

    .line 139
    .line 140
    invoke-interface {v1, v0, v2}, Ll/gzc0;->a(Ll/uje;Ll/uje;)V

    .line 141
    .line 142
    .line 143
    :cond_9
    iget-object v1, p0, Ll/eli0;->m:Ll/bkm;

    .line 144
    .line 145
    if-eqz v1, :cond_b

    .line 146
    .line 147
    sget v2, Ll/eli0;->x:I

    .line 148
    .line 149
    if-ne p2, v2, :cond_a

    .line 150
    .line 151
    invoke-virtual {v1, p3}, Ll/bkm;->h(Ll/kt2;)V

    .line 152
    .line 153
    .line 154
    :cond_a
    sget v1, Ll/eli0;->A:I

    .line 155
    .line 156
    if-ne p2, v1, :cond_b

    .line 157
    .line 158
    iget-object p2, p0, Ll/eli0;->m:Ll/bkm;

    .line 159
    .line 160
    invoke-virtual {p2, p3}, Ll/bkm;->g(Ll/kt2;)V

    .line 161
    .line 162
    .line 163
    :cond_b
    iget-object p2, p0, Ll/eli0;->h:Ljava/util/Map;

    .line 164
    .line 165
    invoke-interface {p2, p1, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 166
    .line 167
    .line 168
    iget-object p0, p0, Ll/eli0;->i:Ljava/util/Map;

    .line 169
    .line 170
    invoke-interface {p0, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 171
    .line 172
    .line 173
    :cond_c
    :goto_6
    return-void
.end method

.method public v0(Ll/qpr;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/eli0;->r:Ll/qpr;

    .line 2
    .line 3
    return-void
.end method

.method public w(Ljava/lang/Object;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Ll/qt2;->w(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    check-cast p1, Lcom/immomo/components/interfaces/IProcessOutput;

    .line 5
    .line 6
    iget-object v0, p0, Ll/eli0;->g:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Ll/eli0;

    .line 23
    .line 24
    invoke-virtual {v1, p1}, Ll/qt2;->F(Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    iget-object p0, p0, Ll/eli0;->j:Ljava/util/LinkedList;

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public w0(Ll/uje;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/eli0;->l:Ll/uje;

    .line 2
    .line 3
    return-void
.end method

.method public x(Ll/kt2;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/qt2;->x(Ll/kt2;)V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    iget-object p0, p0, Ll/eli0;->m:Ll/bkm;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ll/bkm;->m(Ll/kt2;)V

    .line 11
    .line 12
    .line 13
    const-string p0, "mediaRender"

    .line 14
    .line 15
    const-string p1, "handle update filter !!!"

    .line 16
    .line 17
    invoke-static {p0, p1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public x0(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public y(Ll/crf0;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Ll/qt2;->y(Ll/crf0;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string v1, "handle update image Render size"

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Ll/crf0;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "mediaRender"

    .line 23
    .line 24
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Ll/eli0;->m:Ll/bkm;

    .line 28
    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    invoke-virtual {p0, p1}, Ll/bkm;->n(Ll/crf0;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public y0(Ljava/lang/Object;Ll/crf0;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    new-instance v0, Ll/izc0;

    .line 4
    .line 5
    invoke-direct {v0, p1, p2}, Ll/izc0;-><init>(Ljava/lang/Object;Ll/crf0;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/qt2;->T(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {p0, p2}, Ll/qt2;->T(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public z(Ljava/lang/Object;)V
    .locals 2

    .line 1
    const-string v0, "mediaRender"

    .line 2
    .line 3
    const-string v1, "handleUpdateScreenRenderSize !!!"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    instance-of v0, p1, Ll/izc0;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    check-cast p1, Ll/izc0;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ll/eli0;->k0(Ll/izc0;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    check-cast p1, Ll/crf0;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Ll/eli0;->l0(Ll/crf0;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public z0(Ll/tpr;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/eli0;->t:Ll/tpr;

    .line 2
    .line 3
    return-void
.end method
