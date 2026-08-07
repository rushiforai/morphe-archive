.class public Lcom/bumptech/glide/load/engine/h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/bumptech/glide/load/engine/j;
.implements Ll/lpy$a;
.implements Lcom/bumptech/glide/load/engine/m$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bumptech/glide/load/engine/h$b;,
        Lcom/bumptech/glide/load/engine/h$a;,
        Lcom/bumptech/glide/load/engine/h$c;,
        Lcom/bumptech/glide/load/engine/h$d;
    }
.end annotation


# static fields
.field private static final i:Z


# instance fields
.field private final a:Lcom/bumptech/glide/load/engine/n;

.field private final b:Lcom/bumptech/glide/load/engine/l;

.field private final c:Ll/lpy;

.field private final d:Lcom/bumptech/glide/load/engine/h$b;

.field private final e:Lcom/bumptech/glide/load/engine/s;

.field private final f:Lcom/bumptech/glide/load/engine/h$c;

.field private final g:Lcom/bumptech/glide/load/engine/h$a;

.field private final h:Lcom/bumptech/glide/load/engine/a;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-string v0, "Engine"

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    sput-boolean v0, Lcom/bumptech/glide/load/engine/h;->i:Z

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(Ll/lpy;Ll/z3e$a;Ll/a4k;Ll/a4k;Ll/a4k;Ll/a4k;Lcom/bumptech/glide/load/engine/n;Lcom/bumptech/glide/load/engine/l;Lcom/bumptech/glide/load/engine/a;Lcom/bumptech/glide/load/engine/h$b;Lcom/bumptech/glide/load/engine/h$a;Lcom/bumptech/glide/load/engine/s;Z)V
    .locals 8
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/bumptech/glide/load/engine/h;->c:Ll/lpy;

    .line 5
    .line 6
    new-instance v0, Lcom/bumptech/glide/load/engine/h$c;

    .line 7
    .line 8
    invoke-direct {v0, p2}, Lcom/bumptech/glide/load/engine/h$c;-><init>(Ll/z3e$a;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/bumptech/glide/load/engine/h;->f:Lcom/bumptech/glide/load/engine/h$c;

    .line 12
    .line 13
    if-nez p9, :cond_0

    .line 14
    .line 15
    new-instance p2, Lcom/bumptech/glide/load/engine/a;

    .line 16
    .line 17
    move/from16 v1, p13

    .line 18
    .line 19
    invoke-direct {p2, v1}, Lcom/bumptech/glide/load/engine/a;-><init>(Z)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    move-object/from16 p2, p9

    .line 24
    .line 25
    :goto_0
    iput-object p2, p0, Lcom/bumptech/glide/load/engine/h;->h:Lcom/bumptech/glide/load/engine/a;

    .line 26
    .line 27
    invoke-virtual {p2, p0}, Lcom/bumptech/glide/load/engine/a;->f(Lcom/bumptech/glide/load/engine/m$a;)V

    .line 28
    .line 29
    .line 30
    if-nez p8, :cond_1

    .line 31
    .line 32
    new-instance p2, Lcom/bumptech/glide/load/engine/l;

    .line 33
    .line 34
    invoke-direct {p2}, Lcom/bumptech/glide/load/engine/l;-><init>()V

    .line 35
    .line 36
    .line 37
    goto :goto_1

    .line 38
    :cond_1
    move-object/from16 p2, p8

    .line 39
    .line 40
    :goto_1
    iput-object p2, p0, Lcom/bumptech/glide/load/engine/h;->b:Lcom/bumptech/glide/load/engine/l;

    .line 41
    .line 42
    if-nez p7, :cond_2

    .line 43
    .line 44
    new-instance p7, Lcom/bumptech/glide/load/engine/n;

    .line 45
    .line 46
    invoke-direct {p7}, Lcom/bumptech/glide/load/engine/n;-><init>()V

    .line 47
    .line 48
    .line 49
    :cond_2
    iput-object p7, p0, Lcom/bumptech/glide/load/engine/h;->a:Lcom/bumptech/glide/load/engine/n;

    .line 50
    .line 51
    if-nez p10, :cond_3

    .line 52
    .line 53
    new-instance v1, Lcom/bumptech/glide/load/engine/h$b;

    .line 54
    .line 55
    move-object v7, p0

    .line 56
    move-object v6, p0

    .line 57
    move-object v2, p3

    .line 58
    move-object v3, p4

    .line 59
    move-object v4, p5

    .line 60
    move-object v5, p6

    .line 61
    invoke-direct/range {v1 .. v7}, Lcom/bumptech/glide/load/engine/h$b;-><init>(Ll/a4k;Ll/a4k;Ll/a4k;Ll/a4k;Lcom/bumptech/glide/load/engine/j;Lcom/bumptech/glide/load/engine/m$a;)V

    .line 62
    .line 63
    .line 64
    goto :goto_2

    .line 65
    :cond_3
    move-object/from16 v1, p10

    .line 66
    .line 67
    :goto_2
    iput-object v1, p0, Lcom/bumptech/glide/load/engine/h;->d:Lcom/bumptech/glide/load/engine/h$b;

    .line 68
    .line 69
    if-nez p11, :cond_4

    .line 70
    .line 71
    new-instance p2, Lcom/bumptech/glide/load/engine/h$a;

    .line 72
    .line 73
    invoke-direct {p2, v0}, Lcom/bumptech/glide/load/engine/h$a;-><init>(Lcom/bumptech/glide/load/engine/DecodeJob$e;)V

    .line 74
    .line 75
    .line 76
    goto :goto_3

    .line 77
    :cond_4
    move-object/from16 p2, p11

    .line 78
    .line 79
    :goto_3
    iput-object p2, p0, Lcom/bumptech/glide/load/engine/h;->g:Lcom/bumptech/glide/load/engine/h$a;

    .line 80
    .line 81
    if-nez p12, :cond_5

    .line 82
    .line 83
    new-instance p2, Lcom/bumptech/glide/load/engine/s;

    .line 84
    .line 85
    invoke-direct {p2}, Lcom/bumptech/glide/load/engine/s;-><init>()V

    .line 86
    .line 87
    .line 88
    goto :goto_4

    .line 89
    :cond_5
    move-object/from16 p2, p12

    .line 90
    .line 91
    :goto_4
    iput-object p2, p0, Lcom/bumptech/glide/load/engine/h;->e:Lcom/bumptech/glide/load/engine/s;

    .line 92
    .line 93
    invoke-interface {p1, p0}, Ll/lpy;->c(Ll/lpy$a;)V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public constructor <init>(Ll/lpy;Ll/z3e$a;Ll/a4k;Ll/a4k;Ll/a4k;Ll/a4k;Z)V
    .locals 14

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    move-object/from16 v4, p4

    move-object/from16 v5, p5

    move-object/from16 v6, p6

    move/from16 v13, p7

    .line 97
    invoke-direct/range {v0 .. v13}, Lcom/bumptech/glide/load/engine/h;-><init>(Ll/lpy;Ll/z3e$a;Ll/a4k;Ll/a4k;Ll/a4k;Ll/a4k;Lcom/bumptech/glide/load/engine/n;Lcom/bumptech/glide/load/engine/l;Lcom/bumptech/glide/load/engine/a;Lcom/bumptech/glide/load/engine/h$b;Lcom/bumptech/glide/load/engine/h$a;Lcom/bumptech/glide/load/engine/s;Z)V

    return-void
.end method

.method private e(Ll/kzq;)Lcom/bumptech/glide/load/engine/m;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/kzq;",
            ")",
            "Lcom/bumptech/glide/load/engine/m<",
            "*>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/h;->c:Ll/lpy;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ll/lpy;->e(Ll/kzq;)Ll/u3d0;

    .line 4
    .line 5
    .line 6
    move-result-object v2

    .line 7
    if-nez v2, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return-object p0

    .line 11
    :cond_0
    instance-of v0, v2, Lcom/bumptech/glide/load/engine/m;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    check-cast v2, Lcom/bumptech/glide/load/engine/m;

    .line 16
    .line 17
    return-object v2

    .line 18
    :cond_1
    new-instance v1, Lcom/bumptech/glide/load/engine/m;

    .line 19
    .line 20
    const/4 v3, 0x1

    .line 21
    const/4 v4, 0x1

    .line 22
    move-object v6, p0

    .line 23
    move-object v5, p1

    .line 24
    invoke-direct/range {v1 .. v6}, Lcom/bumptech/glide/load/engine/m;-><init>(Ll/u3d0;ZZLl/kzq;Lcom/bumptech/glide/load/engine/m$a;)V

    .line 25
    .line 26
    .line 27
    return-object v1
.end method

.method private g(Ll/kzq;)Lcom/bumptech/glide/load/engine/m;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/kzq;",
            ")",
            "Lcom/bumptech/glide/load/engine/m<",
            "*>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/bumptech/glide/load/engine/h;->h:Lcom/bumptech/glide/load/engine/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/bumptech/glide/load/engine/a;->e(Ll/kzq;)Lcom/bumptech/glide/load/engine/m;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/bumptech/glide/load/engine/m;->a()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-object p0
.end method

.method private h(Ll/kzq;)Lcom/bumptech/glide/load/engine/m;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/kzq;",
            ")",
            "Lcom/bumptech/glide/load/engine/m<",
            "*>;"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Lcom/bumptech/glide/load/engine/h;->e(Ll/kzq;)Lcom/bumptech/glide/load/engine/m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/bumptech/glide/load/engine/m;->a()V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/bumptech/glide/load/engine/h;->h:Lcom/bumptech/glide/load/engine/a;

    .line 11
    .line 12
    invoke-virtual {p0, p1, v0}, Lcom/bumptech/glide/load/engine/a;->a(Ll/kzq;Lcom/bumptech/glide/load/engine/m;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-object v0
.end method

.method private i(Lcom/bumptech/glide/load/engine/k;ZJ)Lcom/bumptech/glide/load/engine/m;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/engine/k;",
            "ZJ)",
            "Lcom/bumptech/glide/load/engine/m<",
            "*>;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p2, :cond_0

    .line 3
    .line 4
    return-object v0

    .line 5
    :cond_0
    invoke-direct {p0, p1}, Lcom/bumptech/glide/load/engine/h;->g(Ll/kzq;)Lcom/bumptech/glide/load/engine/m;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    if-eqz p2, :cond_2

    .line 10
    .line 11
    sget-boolean p0, Lcom/bumptech/glide/load/engine/h;->i:Z

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    const-string p0, "Loaded resource from active resources"

    .line 16
    .line 17
    invoke-static {p0, p3, p4, p1}, Lcom/bumptech/glide/load/engine/h;->j(Ljava/lang/String;JLl/kzq;)V

    .line 18
    .line 19
    .line 20
    :cond_1
    return-object p2

    .line 21
    :cond_2
    invoke-direct {p0, p1}, Lcom/bumptech/glide/load/engine/h;->h(Ll/kzq;)Lcom/bumptech/glide/load/engine/m;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    if-eqz p0, :cond_4

    .line 26
    .line 27
    sget-boolean p2, Lcom/bumptech/glide/load/engine/h;->i:Z

    .line 28
    .line 29
    if-eqz p2, :cond_3

    .line 30
    .line 31
    const-string p2, "Loaded resource from cache"

    .line 32
    .line 33
    invoke-static {p2, p3, p4, p1}, Lcom/bumptech/glide/load/engine/h;->j(Ljava/lang/String;JLl/kzq;)V

    .line 34
    .line 35
    .line 36
    :cond_3
    return-object p0

    .line 37
    :cond_4
    return-object v0
.end method

.method private static j(Ljava/lang/String;JLl/kzq;)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/izv;->a(J)D

    .line 2
    .line 3
    .line 4
    invoke-static {p3}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private l(Lcom/bumptech/glide/c;Ljava/lang/Object;Ll/kzq;IILjava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/Priority;Ll/d4e;Ljava/util/Map;ZZLl/u560;ZZZZLl/w3d0;Ljava/util/concurrent/Executor;Lcom/bumptech/glide/load/engine/k;J)Lcom/bumptech/glide/load/engine/h$d;
    .locals 20
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/bumptech/glide/c;",
            "Ljava/lang/Object;",
            "Ll/kzq;",
            "II",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/Class<",
            "TR;>;",
            "Lcom/bumptech/glide/Priority;",
            "Ll/d4e;",
            "Ljava/util/Map<",
            "Ljava/lang/Class<",
            "*>;",
            "Ll/tgj0<",
            "*>;>;ZZ",
            "Ll/u560;",
            "ZZZZ",
            "Ll/w3d0;",
            "Ljava/util/concurrent/Executor;",
            "Lcom/bumptech/glide/load/engine/k;",
            "J)",
            "Lcom/bumptech/glide/load/engine/h$d;"
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p18

    move-object/from16 v2, p19

    move-object/from16 v4, p20

    move-wide/from16 v9, p21

    .line 1
    iget-object v3, v0, Lcom/bumptech/glide/load/engine/h;->a:Lcom/bumptech/glide/load/engine/n;

    move/from16 v8, p17

    invoke-virtual {v3, v4, v8}, Lcom/bumptech/glide/load/engine/n;->a(Ll/kzq;Z)Lcom/bumptech/glide/load/engine/i;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 2
    invoke-virtual {v3, v1, v2}, Lcom/bumptech/glide/load/engine/i;->e(Ll/w3d0;Ljava/util/concurrent/Executor;)V

    .line 3
    sget-boolean v2, Lcom/bumptech/glide/load/engine/h;->i:Z

    if-eqz v2, :cond_0

    .line 4
    const-string v2, "Added to existing load"

    invoke-static {v2, v9, v10, v4}, Lcom/bumptech/glide/load/engine/h;->j(Ljava/lang/String;JLl/kzq;)V

    .line 5
    :cond_0
    new-instance v2, Lcom/bumptech/glide/load/engine/h$d;

    invoke-direct {v2, v0, v1, v3}, Lcom/bumptech/glide/load/engine/h$d;-><init>(Lcom/bumptech/glide/load/engine/h;Ll/w3d0;Lcom/bumptech/glide/load/engine/i;)V

    return-object v2

    .line 6
    :cond_1
    iget-object v3, v0, Lcom/bumptech/glide/load/engine/h;->d:Lcom/bumptech/glide/load/engine/h$b;

    move/from16 v5, p14

    move/from16 v6, p15

    move/from16 v7, p16

    .line 7
    invoke-virtual/range {v3 .. v8}, Lcom/bumptech/glide/load/engine/h$b;->a(Ll/kzq;ZZZZ)Lcom/bumptech/glide/load/engine/i;

    move-result-object v19

    .line 8
    iget-object v3, v0, Lcom/bumptech/glide/load/engine/h;->g:Lcom/bumptech/glide/load/engine/h$a;

    move-object/from16 v4, p1

    move-object/from16 v5, p2

    move-object/from16 v7, p3

    move/from16 v8, p4

    move/from16 v9, p5

    move-object/from16 v10, p6

    move-object/from16 v11, p7

    move-object/from16 v12, p8

    move-object/from16 v13, p9

    move-object/from16 v14, p10

    move/from16 v15, p11

    move/from16 v16, p12

    move-object/from16 v18, p13

    move/from16 v17, p17

    move-object/from16 v6, p20

    .line 9
    invoke-virtual/range {v3 .. v19}, Lcom/bumptech/glide/load/engine/h$a;->a(Lcom/bumptech/glide/c;Ljava/lang/Object;Lcom/bumptech/glide/load/engine/k;Ll/kzq;IILjava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/Priority;Ll/d4e;Ljava/util/Map;ZZZLl/u560;Lcom/bumptech/glide/load/engine/DecodeJob$b;)Lcom/bumptech/glide/load/engine/DecodeJob;

    move-result-object v3

    move-object v4, v6

    move-object/from16 v5, v19

    .line 10
    iget-object v6, v0, Lcom/bumptech/glide/load/engine/h;->a:Lcom/bumptech/glide/load/engine/n;

    invoke-virtual {v6, v4, v5}, Lcom/bumptech/glide/load/engine/n;->c(Ll/kzq;Lcom/bumptech/glide/load/engine/i;)V

    .line 11
    invoke-virtual {v5, v1, v2}, Lcom/bumptech/glide/load/engine/i;->e(Ll/w3d0;Ljava/util/concurrent/Executor;)V

    .line 12
    invoke-virtual {v5, v3}, Lcom/bumptech/glide/load/engine/i;->s(Lcom/bumptech/glide/load/engine/DecodeJob;)V

    .line 13
    sget-boolean v2, Lcom/bumptech/glide/load/engine/h;->i:Z

    if-eqz v2, :cond_2

    .line 14
    const-string v2, "Started new load"

    move-wide/from16 v9, p21

    invoke-static {v2, v9, v10, v4}, Lcom/bumptech/glide/load/engine/h;->j(Ljava/lang/String;JLl/kzq;)V

    .line 15
    :cond_2
    new-instance v2, Lcom/bumptech/glide/load/engine/h$d;

    invoke-direct {v2, v0, v1, v5}, Lcom/bumptech/glide/load/engine/h$d;-><init>(Lcom/bumptech/glide/load/engine/h;Ll/w3d0;Lcom/bumptech/glide/load/engine/i;)V

    return-object v2
.end method


# virtual methods
.method public declared-synchronized a(Lcom/bumptech/glide/load/engine/i;Ll/kzq;Lcom/bumptech/glide/load/engine/m;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/engine/i<",
            "*>;",
            "Ll/kzq;",
            "Lcom/bumptech/glide/load/engine/m<",
            "*>;)V"
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    if-eqz p3, :cond_0

    .line 3
    .line 4
    :try_start_0
    invoke-virtual {p3}, Lcom/bumptech/glide/load/engine/m;->c()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/h;->h:Lcom/bumptech/glide/load/engine/a;

    .line 11
    .line 12
    invoke-virtual {v0, p2, p3}, Lcom/bumptech/glide/load/engine/a;->a(Ll/kzq;Lcom/bumptech/glide/load/engine/m;)V

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception p1

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    :goto_0
    iget-object p3, p0, Lcom/bumptech/glide/load/engine/h;->a:Lcom/bumptech/glide/load/engine/n;

    .line 19
    .line 20
    invoke-virtual {p3, p2, p1}, Lcom/bumptech/glide/load/engine/n;->d(Ll/kzq;Lcom/bumptech/glide/load/engine/i;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    .line 22
    .line 23
    monitor-exit p0

    .line 24
    return-void

    .line 25
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 26
    throw p1
.end method

.method public declared-synchronized b(Lcom/bumptech/glide/load/engine/i;Ll/kzq;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/engine/i<",
            "*>;",
            "Ll/kzq;",
            ")V"
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/h;->a:Lcom/bumptech/glide/load/engine/n;

    .line 3
    .line 4
    invoke-virtual {v0, p2, p1}, Lcom/bumptech/glide/load/engine/n;->d(Ll/kzq;Lcom/bumptech/glide/load/engine/i;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    .line 6
    .line 7
    monitor-exit p0

    .line 8
    return-void

    .line 9
    :catchall_0
    move-exception p1

    .line 10
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 11
    throw p1
.end method

.method public c(Ll/u3d0;)V
    .locals 1
    .param p1    # Ll/u3d0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/u3d0<",
            "*>;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/bumptech/glide/load/engine/h;->e:Lcom/bumptech/glide/load/engine/s;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, p1, v0}, Lcom/bumptech/glide/load/engine/s;->a(Ll/u3d0;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public d(Ll/kzq;Lcom/bumptech/glide/load/engine/m;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/kzq;",
            "Lcom/bumptech/glide/load/engine/m<",
            "*>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/h;->h:Lcom/bumptech/glide/load/engine/a;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/bumptech/glide/load/engine/a;->d(Ll/kzq;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p2}, Lcom/bumptech/glide/load/engine/m;->c()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Lcom/bumptech/glide/load/engine/h;->c:Ll/lpy;

    .line 13
    .line 14
    invoke-interface {p0, p1, p2}, Ll/lpy;->d(Ll/kzq;Ll/u3d0;)Ll/u3d0;

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget-object p0, p0, Lcom/bumptech/glide/load/engine/h;->e:Lcom/bumptech/glide/load/engine/s;

    .line 19
    .line 20
    const/4 p1, 0x0

    .line 21
    invoke-virtual {p0, p2, p1}, Lcom/bumptech/glide/load/engine/s;->a(Ll/u3d0;Z)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public f(Lcom/bumptech/glide/c;Ljava/lang/Object;Ll/kzq;IILjava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/Priority;Ll/d4e;Ljava/util/Map;ZZLl/u560;ZZZZLl/w3d0;Ljava/util/concurrent/Executor;)Lcom/bumptech/glide/load/engine/h$d;
    .locals 25
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/bumptech/glide/c;",
            "Ljava/lang/Object;",
            "Ll/kzq;",
            "II",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/Class<",
            "TR;>;",
            "Lcom/bumptech/glide/Priority;",
            "Ll/d4e;",
            "Ljava/util/Map<",
            "Ljava/lang/Class<",
            "*>;",
            "Ll/tgj0<",
            "*>;>;ZZ",
            "Ll/u560;",
            "ZZZZ",
            "Ll/w3d0;",
            "Ljava/util/concurrent/Executor;",
            ")",
            "Lcom/bumptech/glide/load/engine/h$d;"
        }
    .end annotation

    move-object/from16 v2, p0

    .line 1
    sget-boolean v0, Lcom/bumptech/glide/load/engine/h;->i:Z

    if-eqz v0, :cond_0

    invoke-static {}, Ll/izv;->b()J

    move-result-wide v0

    goto :goto_0

    :cond_0
    const-wide/16 v0, 0x0

    .line 2
    :goto_0
    iget-object v3, v2, Lcom/bumptech/glide/load/engine/h;->b:Lcom/bumptech/glide/load/engine/l;

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    move/from16 v6, p4

    move/from16 v7, p5

    move-object/from16 v9, p6

    move-object/from16 v10, p7

    move-object/from16 v8, p10

    move-object/from16 v11, p13

    .line 3
    invoke-virtual/range {v3 .. v11}, Lcom/bumptech/glide/load/engine/l;->a(Ljava/lang/Object;Ll/kzq;IILjava/util/Map;Ljava/lang/Class;Ljava/lang/Class;Ll/u560;)Lcom/bumptech/glide/load/engine/k;

    move-result-object v3

    .line 4
    monitor-enter p0

    move/from16 v4, p14

    .line 5
    :try_start_0
    invoke-direct {v2, v3, v4, v0, v1}, Lcom/bumptech/glide/load/engine/h;->i(Lcom/bumptech/glide/load/engine/k;ZJ)Lcom/bumptech/glide/load/engine/m;

    move-result-object v5

    if-nez v5, :cond_1

    move-object/from16 v5, p3

    move/from16 v6, p4

    move/from16 v7, p5

    move-object/from16 v8, p6

    move-object/from16 v9, p7

    move-object/from16 v10, p8

    move-object/from16 v11, p9

    move-object/from16 v12, p10

    move/from16 v13, p11

    move/from16 v14, p12

    move-object/from16 v15, p13

    move/from16 v17, p15

    move/from16 v18, p16

    move/from16 v19, p17

    move-object/from16 v20, p18

    move-object/from16 v21, p19

    move-wide/from16 v23, v0

    move-object/from16 v22, v3

    move/from16 v16, v4

    move-object/from16 v3, p1

    move-object/from16 v4, p2

    .line 6
    invoke-direct/range {v2 .. v24}, Lcom/bumptech/glide/load/engine/h;->l(Lcom/bumptech/glide/c;Ljava/lang/Object;Ll/kzq;IILjava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/Priority;Ll/d4e;Ljava/util/Map;ZZLl/u560;ZZZZLl/w3d0;Ljava/util/concurrent/Executor;Lcom/bumptech/glide/load/engine/k;J)Lcom/bumptech/glide/load/engine/h$d;

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    goto :goto_1

    :cond_1
    move-object v0, v5

    .line 7
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    sget-object v1, Lcom/bumptech/glide/load/DataSource;->MEMORY_CACHE:Lcom/bumptech/glide/load/DataSource;

    const/4 v2, 0x0

    move-object/from16 v3, p18

    invoke-interface {v3, v0, v1, v2}, Ll/w3d0;->a(Ll/u3d0;Lcom/bumptech/glide/load/DataSource;Z)V

    const/4 v0, 0x0

    return-object v0

    .line 9
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public k(Ll/u3d0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/u3d0<",
            "*>;)V"
        }
    .end annotation

    .line 1
    instance-of p0, p1, Lcom/bumptech/glide/load/engine/m;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/bumptech/glide/load/engine/m;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/bumptech/glide/load/engine/m;->d()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    const-string p0, "Cannot release anything but an EngineResource"

    .line 12
    .line 13
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
