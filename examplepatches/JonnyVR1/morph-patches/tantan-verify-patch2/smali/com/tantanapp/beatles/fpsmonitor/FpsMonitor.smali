.class public Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;
.super Ll/ioi0;
.source "SourceFile"

# interfaces
.implements Lcom/tantanapp/beatles/fpsmonitor/a$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$DropStatus;,
        Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$d;,
        Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$c;,
        Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$b;,
        Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$e;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ioi0<",
        "Ll/m4j;",
        ">;",
        "Lcom/tantanapp/beatles/fpsmonitor/a$a;"
    }
.end annotation


# instance fields
.field public h:I

.field public i:I

.field public j:J

.field public k:Ljava/lang/String;

.field public l:J

.field public m:Ll/i4j;

.field public n:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ll/utl;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/ioi0;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/32 v0, 0xfe502a

    .line 5
    .line 6
    .line 7
    iput-wide v0, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;->j:J

    .line 8
    .line 9
    const-wide/16 v0, 0x0

    .line 10
    .line 11
    iput-wide v0, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;->l:J

    .line 12
    .line 13
    new-instance v0, Ljava/util/HashMap;

    .line 14
    .line 15
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;->n:Ljava/util/HashMap;

    .line 19
    .line 20
    new-instance v0, Ll/i4j;

    .line 21
    .line 22
    invoke-direct {v0}, Ll/i4j;-><init>()V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;->m:Ll/i4j;

    .line 26
    .line 27
    return-void
.end method

.method public synthetic constructor <init>(Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$a;)V
    .locals 0

    .line 28
    invoke-direct {p0}, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;-><init>()V

    return-void
.end method

.method public static synthetic t(Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/ioi0;->e:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic u(Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;)Ll/i4j;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;->m:Ll/i4j;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic v(Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;->j:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static x()Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;
    .locals 1

    .line 1
    invoke-static {}, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$e;->a()Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method


# virtual methods
.method public final A()V
    .locals 2

    return-void

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;->l:J

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput v0, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;->h:I

    .line 7
    .line 8
    return-void
.end method

.method public B()V
    .locals 1

    return-void

    .line 1
    iget-object v0, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;->m:Ll/i4j;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/i4j;->a()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const-string v0, "collector"

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;->b(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public a()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;->n:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/HashMap;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-lez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public b(Ljava/lang/String;)V
    .locals 2

    return-void

    .line 1
    iget-boolean v0, p0, Ll/ioi0;->d:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;->n:Ljava/util/HashMap;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Ll/utl;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    new-instance v1, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$a;

    .line 17
    .line 18
    invoke-direct {v1, p0, v0, p1}, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$a;-><init>(Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;Ll/utl;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v1}, Ll/u21;->b(Ljava/lang/Runnable;)V

    .line 22
    .line 23
    .line 24
    :cond_1
    iget-object p0, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;->n:Ljava/util/HashMap;

    .line 25
    .line 26
    invoke-virtual {p0}, Ljava/util/HashMap;->size()I

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    if-nez p0, :cond_2

    .line 31
    .line 32
    invoke-static {}, Lcom/tantanapp/beatles/fpsmonitor/a;->e()Lcom/tantanapp/beatles/fpsmonitor/a;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0}, Lcom/tantanapp/beatles/fpsmonitor/a;->k()V

    .line 37
    .line 38
    .line 39
    :cond_2
    :goto_0
    return-void
.end method

.method public c()J
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public d()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public doFrame(J)V
    .locals 1

    return-void

    .line 1
    iget-object v0, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;->n:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;->z(J)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public e()J
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public bridge synthetic f()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;->y()Ll/m4j;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public h(Ljava/lang/String;Ll/utl;)V
    .locals 1

    return-void

    .line 1
    iget-boolean v0, p0, Ll/ioi0;->d:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-static {}, Lcom/tantanapp/beatles/fpsmonitor/a;->e()Lcom/tantanapp/beatles/fpsmonitor/a;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Lcom/tantanapp/beatles/fpsmonitor/a;->h()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-static {}, Lcom/tantanapp/beatles/fpsmonitor/a;->e()Lcom/tantanapp/beatles/fpsmonitor/a;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Lcom/tantanapp/beatles/fpsmonitor/a;->j()V

    .line 21
    .line 22
    .line 23
    :cond_1
    iget-object v0, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;->n:Ljava/util/HashMap;

    .line 24
    .line 25
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_2

    .line 30
    .line 31
    iget-object p0, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;->n:Ljava/util/HashMap;

    .line 32
    .line 33
    invoke-virtual {p0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    :cond_2
    :goto_0
    return-void
.end method

.method public j()Ljava/lang/String;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    const-string p0, "fps"

    .line 2
    .line 3
    return-object p0
.end method

.method public k()Ll/f6m;
    .locals 1

    .line 1
    new-instance v0, Ll/l4j;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;->j()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {v0, p0}, Ll/l4j;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public l()Ll/uni0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;->m:Ll/i4j;

    .line 2
    .line 3
    return-object p0
.end method

.method public m()V
    .locals 1

    return-void

    .line 1
    invoke-static {}, Lcom/tantanapp/beatles/fpsmonitor/a;->e()Lcom/tantanapp/beatles/fpsmonitor/a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/tantanapp/beatles/fpsmonitor/a;->g()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-static {}, Lcom/tantanapp/beatles/fpsmonitor/a;->e()Lcom/tantanapp/beatles/fpsmonitor/a;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0, p0}, Lcom/tantanapp/beatles/fpsmonitor/a;->i(Lcom/tantanapp/beatles/fpsmonitor/a$a;)V

    .line 17
    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    iput-boolean v0, p0, Ll/ioi0;->d:Z

    .line 21
    .line 22
    return-void
.end method

.method public p()I
    .locals 0

    .line 1
    const/16 p0, 0x32

    return p0
.end method

.method public pause()V
    .locals 0

    return-void

    .line 1
    invoke-virtual {p0}, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;->A()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public r()V
    .locals 2

    return-void

    .line 1
    invoke-virtual {p0}, Ll/ioi0;->o()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    new-instance v0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$c;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-direct {v0, p0, v1}, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$c;-><init>(Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$a;)V

    .line 12
    .line 13
    .line 14
    const-string v1, "collector"

    .line 15
    .line 16
    invoke-virtual {p0, v1, v0}, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;->h(Ljava/lang/String;Ll/utl;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final w(JJILjava/lang/String;)V
    .locals 20

    return-void

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;->n:Ljava/util/HashMap;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    if-eqz v2, :cond_2

    .line 18
    .line 19
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    check-cast v2, Ljava/util/Map$Entry;

    .line 24
    .line 25
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    check-cast v3, Ljava/lang/String;

    .line 30
    .line 31
    const-string v4, "collector"

    .line 32
    .line 33
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    if-eqz v3, :cond_1

    .line 38
    .line 39
    const-string v3, "default"

    .line 40
    .line 41
    iget-object v4, v0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;->k:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    if-nez v3, :cond_0

    .line 48
    .line 49
    new-instance v4, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$b;

    .line 50
    .line 51
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    move-object v5, v2

    .line 56
    check-cast v5, Ll/utl;

    .line 57
    .line 58
    iget-wide v6, v0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;->l:J

    .line 59
    .line 60
    iget-object v10, v0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;->k:Ljava/lang/String;

    .line 61
    .line 62
    iget v11, v0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;->i:I

    .line 63
    .line 64
    move-wide/from16 v8, p3

    .line 65
    .line 66
    invoke-direct/range {v4 .. v11}, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$b;-><init>(Ll/utl;JJLjava/lang/String;I)V

    .line 67
    .line 68
    .line 69
    invoke-static {v4}, Ll/u21;->b(Ljava/lang/Runnable;)V

    .line 70
    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_1
    new-instance v12, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$b;

    .line 74
    .line 75
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    move-object v13, v2

    .line 80
    check-cast v13, Ll/utl;

    .line 81
    .line 82
    iget-wide v14, v0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;->l:J

    .line 83
    .line 84
    iget-object v2, v0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;->k:Ljava/lang/String;

    .line 85
    .line 86
    iget v3, v0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;->i:I

    .line 87
    .line 88
    move-wide/from16 v16, p3

    .line 89
    .line 90
    move-object/from16 v18, v2

    .line 91
    .line 92
    move/from16 v19, v3

    .line 93
    .line 94
    invoke-direct/range {v12 .. v19}, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor$b;-><init>(Ll/utl;JJLjava/lang/String;I)V

    .line 95
    .line 96
    .line 97
    invoke-static {v12}, Ll/u21;->b(Ljava/lang/Runnable;)V

    .line 98
    .line 99
    .line 100
    goto :goto_0

    .line 101
    :cond_2
    return-void
.end method

.method public y()Ll/m4j;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public final z(J)V
    .locals 11

    return-void

    .line 1
    iget-wide v1, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;->l:J

    .line 2
    .line 3
    const-wide/16 v5, 0x0

    .line 4
    .line 5
    cmp-long v5, v1, v5

    .line 6
    .line 7
    const/4 v7, 0x0

    .line 8
    if-nez v5, :cond_0

    .line 9
    .line 10
    iput-wide p1, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;->l:J

    .line 11
    .line 12
    iput v7, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;->h:I

    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget v5, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;->h:I

    .line 16
    .line 17
    add-int/lit8 v5, v5, 0x1

    .line 18
    .line 19
    iput v5, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;->h:I

    .line 20
    .line 21
    sub-long v5, p1, v1

    .line 22
    .line 23
    const-wide/32 v8, 0xf4240

    .line 24
    .line 25
    .line 26
    div-long/2addr v5, v8

    .line 27
    const-wide/16 v8, 0x3e8

    .line 28
    .line 29
    cmp-long v5, v5, v8

    .line 30
    .line 31
    if-ltz v5, :cond_4

    .line 32
    .line 33
    sub-long v1, p1, v1

    .line 34
    .line 35
    long-to-float v1, v1

    .line 36
    const v2, 0x49742400    # 1000000.0f

    .line 37
    .line 38
    .line 39
    div-float v8, v1, v2

    .line 40
    .line 41
    invoke-static {}, Lcom/tantanapp/beatles/fpsmonitor/a;->e()Lcom/tantanapp/beatles/fpsmonitor/a;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v1}, Lcom/tantanapp/beatles/fpsmonitor/a;->f()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    iput-object v1, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;->k:Ljava/lang/String;

    .line 50
    .line 51
    const/high16 v1, 0x44fa0000    # 2000.0f

    .line 52
    .line 53
    cmpl-float v1, v8, v1

    .line 54
    .line 55
    if-ltz v1, :cond_2

    .line 56
    .line 57
    const/high16 v1, 0x447a0000    # 1000.0f

    .line 58
    .line 59
    sub-float v2, v8, v1

    .line 60
    .line 61
    div-float/2addr v2, v1

    .line 62
    float-to-int v9, v2

    .line 63
    move v10, v7

    .line 64
    :goto_0
    if-ge v10, v9, :cond_1

    .line 65
    .line 66
    iget-wide v1, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;->l:J

    .line 67
    .line 68
    const/4 v5, 0x0

    .line 69
    iget-object v6, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;->k:Ljava/lang/String;

    .line 70
    .line 71
    move-object v0, p0

    .line 72
    move-wide v3, p1

    .line 73
    invoke-virtual/range {v0 .. v6}, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;->w(JJILjava/lang/String;)V

    .line 74
    .line 75
    .line 76
    add-int/lit8 v10, v10, 0x1

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_1
    mul-int/lit16 v9, v9, 0x3e8

    .line 80
    .line 81
    int-to-float v1, v9

    .line 82
    sub-float/2addr v8, v1

    .line 83
    :cond_2
    iget v1, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;->h:I

    .line 84
    .line 85
    mul-int/lit16 v1, v1, 0x3e8

    .line 86
    .line 87
    int-to-float v1, v1

    .line 88
    div-float/2addr v1, v8

    .line 89
    float-to-int v1, v1

    .line 90
    iput v1, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;->h:I

    .line 91
    .line 92
    const/16 v2, 0x3c

    .line 93
    .line 94
    invoke-static {v2, v1}, Ljava/lang/Math;->min(II)I

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    iput v1, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;->i:I

    .line 99
    .line 100
    iget-boolean v1, p0, Ll/ioi0;->e:Z

    .line 101
    .line 102
    if-nez v1, :cond_3

    .line 103
    .line 104
    invoke-virtual {p0}, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;->B()V

    .line 105
    .line 106
    .line 107
    :cond_3
    iget-wide v1, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;->l:J

    .line 108
    .line 109
    iget v5, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;->i:I

    .line 110
    .line 111
    iget-object v6, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;->k:Ljava/lang/String;

    .line 112
    .line 113
    move-object v0, p0

    .line 114
    move-wide v3, p1

    .line 115
    invoke-virtual/range {v0 .. v6}, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;->w(JJILjava/lang/String;)V

    .line 116
    .line 117
    .line 118
    iput v7, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;->h:I

    .line 119
    .line 120
    iput-wide p1, p0, Lcom/tantanapp/beatles/fpsmonitor/FpsMonitor;->l:J

    .line 121
    .line 122
    :cond_4
    return-void
.end method
