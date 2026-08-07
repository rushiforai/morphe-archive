.class public Ll/a2d0;
.super Ll/lr2;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<TranscodeType:",
        "Ljava/lang/Object;",
        ">",
        "Ll/lr2<",
        "Ll/a2d0<",
        "TTranscodeType;>;>;",
        "Ljava/lang/Cloneable;"
    }
.end annotation


# static fields
.field protected static final O:Ll/p2d0;


# instance fields
.field private final A:Landroid/content/Context;

.field private final B:Ll/m2d0;

.field private final C:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "TTranscodeType;>;"
        }
    .end annotation
.end field

.field private final D:Lcom/bumptech/glide/a;

.field private final E:Lcom/bumptech/glide/c;

.field private F:Ll/aij0;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/aij0<",
            "*-TTranscodeType;>;"
        }
    .end annotation
.end field

.field private G:Ljava/lang/Object;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private H:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/l2d0<",
            "TTranscodeType;>;>;"
        }
    .end annotation
.end field

.field private I:Ll/a2d0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/a2d0<",
            "TTranscodeType;>;"
        }
    .end annotation
.end field

.field private J:Ll/a2d0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/a2d0<",
            "TTranscodeType;>;"
        }
    .end annotation
.end field

.field private K:Ljava/lang/Float;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private L:Z

.field private M:Z

.field private N:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/p2d0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/p2d0;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Ll/d4e;->c:Ll/d4e;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ll/lr2;->e(Ll/d4e;)Ll/lr2;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Ll/p2d0;

    .line 13
    .line 14
    sget-object v1, Lcom/bumptech/glide/Priority;->LOW:Lcom/bumptech/glide/Priority;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ll/lr2;->Z(Lcom/bumptech/glide/Priority;)Ll/lr2;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Ll/p2d0;

    .line 21
    .line 22
    const/4 v1, 0x1

    .line 23
    invoke-virtual {v0, v1}, Ll/lr2;->g0(Z)Ll/lr2;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Ll/p2d0;

    .line 28
    .line 29
    sput-object v0, Ll/a2d0;->O:Ll/p2d0;

    .line 30
    .line 31
    return-void
.end method

.method public constructor <init>(Lcom/bumptech/glide/a;Ll/m2d0;Ljava/lang/Class;Landroid/content/Context;)V
    .locals 1
    .param p1    # Lcom/bumptech/glide/a;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "CheckResult"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/a;",
            "Ll/m2d0;",
            "Ljava/lang/Class<",
            "TTranscodeType;>;",
            "Landroid/content/Context;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/lr2;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Ll/a2d0;->L:Z

    .line 6
    .line 7
    iput-object p1, p0, Ll/a2d0;->D:Lcom/bumptech/glide/a;

    .line 8
    .line 9
    iput-object p2, p0, Ll/a2d0;->B:Ll/m2d0;

    .line 10
    .line 11
    iput-object p3, p0, Ll/a2d0;->C:Ljava/lang/Class;

    .line 12
    .line 13
    iput-object p4, p0, Ll/a2d0;->A:Landroid/content/Context;

    .line 14
    .line 15
    invoke-virtual {p2, p3}, Ll/m2d0;->q(Ljava/lang/Class;)Ll/aij0;

    .line 16
    .line 17
    .line 18
    move-result-object p3

    .line 19
    iput-object p3, p0, Ll/a2d0;->F:Ll/aij0;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/bumptech/glide/a;->i()Lcom/bumptech/glide/c;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iput-object p1, p0, Ll/a2d0;->E:Lcom/bumptech/glide/c;

    .line 26
    .line 27
    invoke-virtual {p2}, Ll/m2d0;->o()Ljava/util/List;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-direct {p0, p1}, Ll/a2d0;->t0(Ljava/util/List;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p2}, Ll/m2d0;->p()Ll/p2d0;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p0, p1}, Ll/a2d0;->n0(Ll/lr2;)Ll/a2d0;

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method private E0(Ljava/lang/Object;)Ll/a2d0;
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ll/a2d0<",
            "TTranscodeType;>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/lr2;->D()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/a2d0;->r0()Ll/a2d0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-direct {p0, p1}, Ll/a2d0;->E0(Ljava/lang/Object;)Ll/a2d0;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    iput-object p1, p0, Ll/a2d0;->G:Ljava/lang/Object;

    .line 17
    .line 18
    const/4 p1, 0x1

    .line 19
    iput-boolean p1, p0, Ll/a2d0;->M:Z

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/lr2;->c0()Ll/lr2;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    check-cast p0, Ll/a2d0;

    .line 26
    .line 27
    return-object p0
.end method

.method private F0(Ljava/lang/Object;Ll/cli0;Ll/l2d0;Ll/lr2;Lcom/bumptech/glide/request/RequestCoordinator;Ll/aij0;Lcom/bumptech/glide/Priority;IILjava/util/concurrent/Executor;)Ll/y1d0;
    .locals 17
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ll/cli0<",
            "TTranscodeType;>;",
            "Ll/l2d0<",
            "TTranscodeType;>;",
            "Ll/lr2<",
            "*>;",
            "Lcom/bumptech/glide/request/RequestCoordinator;",
            "Ll/aij0<",
            "*-TTranscodeType;>;",
            "Lcom/bumptech/glide/Priority;",
            "II",
            "Ljava/util/concurrent/Executor;",
            ")",
            "Ll/y1d0;"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Ll/a2d0;->A:Landroid/content/Context;

    .line 4
    .line 5
    iget-object v2, v0, Ll/a2d0;->E:Lcom/bumptech/glide/c;

    .line 6
    .line 7
    iget-object v4, v0, Ll/a2d0;->G:Ljava/lang/Object;

    .line 8
    .line 9
    iget-object v5, v0, Ll/a2d0;->C:Ljava/lang/Class;

    .line 10
    .line 11
    iget-object v12, v0, Ll/a2d0;->H:Ljava/util/List;

    .line 12
    .line 13
    invoke-virtual {v2}, Lcom/bumptech/glide/c;->f()Lcom/bumptech/glide/load/engine/h;

    .line 14
    .line 15
    .line 16
    move-result-object v14

    .line 17
    invoke-virtual/range {p6 .. p6}, Ll/aij0;->b()Ll/xhj0;

    .line 18
    .line 19
    .line 20
    move-result-object v15

    .line 21
    move-object/from16 v3, p1

    .line 22
    .line 23
    move-object/from16 v10, p2

    .line 24
    .line 25
    move-object/from16 v11, p3

    .line 26
    .line 27
    move-object/from16 v6, p4

    .line 28
    .line 29
    move-object/from16 v13, p5

    .line 30
    .line 31
    move-object/from16 v9, p7

    .line 32
    .line 33
    move/from16 v7, p8

    .line 34
    .line 35
    move/from16 v8, p9

    .line 36
    .line 37
    move-object/from16 v16, p10

    .line 38
    .line 39
    invoke-static/range {v1 .. v16}, Lcom/bumptech/glide/request/SingleRequest;->x(Landroid/content/Context;Lcom/bumptech/glide/c;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Class;Ll/lr2;IILcom/bumptech/glide/Priority;Ll/cli0;Ll/l2d0;Ljava/util/List;Lcom/bumptech/glide/request/RequestCoordinator;Lcom/bumptech/glide/load/engine/h;Ll/xhj0;Ljava/util/concurrent/Executor;)Lcom/bumptech/glide/request/SingleRequest;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    return-object v0
.end method

.method private o0(Ll/cli0;Ll/l2d0;Ll/lr2;Ljava/util/concurrent/Executor;)Ll/y1d0;
    .locals 11
    .param p2    # Ll/l2d0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/cli0<",
            "TTranscodeType;>;",
            "Ll/l2d0<",
            "TTranscodeType;>;",
            "Ll/lr2<",
            "*>;",
            "Ljava/util/concurrent/Executor;",
            ")",
            "Ll/y1d0;"
        }
    .end annotation

    .line 1
    new-instance v1, Ljava/lang/Object;

    .line 2
    .line 3
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v5, p0, Ll/a2d0;->F:Ll/aij0;

    .line 7
    .line 8
    invoke-virtual {p3}, Ll/lr2;->v()Lcom/bumptech/glide/Priority;

    .line 9
    .line 10
    .line 11
    move-result-object v6

    .line 12
    invoke-virtual {p3}, Ll/lr2;->s()I

    .line 13
    .line 14
    .line 15
    move-result v7

    .line 16
    invoke-virtual {p3}, Ll/lr2;->r()I

    .line 17
    .line 18
    .line 19
    move-result v8

    .line 20
    const/4 v4, 0x0

    .line 21
    move-object v0, p0

    .line 22
    move-object v2, p1

    .line 23
    move-object v3, p2

    .line 24
    move-object v9, p3

    .line 25
    move-object v10, p4

    .line 26
    invoke-direct/range {v0 .. v10}, Ll/a2d0;->p0(Ljava/lang/Object;Ll/cli0;Ll/l2d0;Lcom/bumptech/glide/request/RequestCoordinator;Ll/aij0;Lcom/bumptech/glide/Priority;IILl/lr2;Ljava/util/concurrent/Executor;)Ll/y1d0;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method

.method private p0(Ljava/lang/Object;Ll/cli0;Ll/l2d0;Lcom/bumptech/glide/request/RequestCoordinator;Ll/aij0;Lcom/bumptech/glide/Priority;IILl/lr2;Ljava/util/concurrent/Executor;)Ll/y1d0;
    .locals 2
    .param p3    # Ll/l2d0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Lcom/bumptech/glide/request/RequestCoordinator;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ll/cli0<",
            "TTranscodeType;>;",
            "Ll/l2d0<",
            "TTranscodeType;>;",
            "Lcom/bumptech/glide/request/RequestCoordinator;",
            "Ll/aij0<",
            "*-TTranscodeType;>;",
            "Lcom/bumptech/glide/Priority;",
            "II",
            "Ll/lr2<",
            "*>;",
            "Ljava/util/concurrent/Executor;",
            ")",
            "Ll/y1d0;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/a2d0;->J:Ll/a2d0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/bumptech/glide/request/a;

    .line 6
    .line 7
    invoke-direct {v0, p1, p4}, Lcom/bumptech/glide/request/a;-><init>(Ljava/lang/Object;Lcom/bumptech/glide/request/RequestCoordinator;)V

    .line 8
    .line 9
    .line 10
    move-object p4, v0

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 v0, 0x0

    .line 13
    :goto_0
    invoke-direct/range {p0 .. p10}, Ll/a2d0;->q0(Ljava/lang/Object;Ll/cli0;Ll/l2d0;Lcom/bumptech/glide/request/RequestCoordinator;Ll/aij0;Lcom/bumptech/glide/Priority;IILl/lr2;Ljava/util/concurrent/Executor;)Ll/y1d0;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    return-object v1

    .line 20
    :cond_1
    iget-object p4, p0, Ll/a2d0;->J:Ll/a2d0;

    .line 21
    .line 22
    invoke-virtual {p4}, Ll/lr2;->s()I

    .line 23
    .line 24
    .line 25
    move-result p4

    .line 26
    iget-object p5, p0, Ll/a2d0;->J:Ll/a2d0;

    .line 27
    .line 28
    invoke-virtual {p5}, Ll/lr2;->r()I

    .line 29
    .line 30
    .line 31
    move-result p5

    .line 32
    invoke-static {p7, p8}, Ll/ylk0;->u(II)Z

    .line 33
    .line 34
    .line 35
    move-result p6

    .line 36
    if-eqz p6, :cond_2

    .line 37
    .line 38
    iget-object p6, p0, Ll/a2d0;->J:Ll/a2d0;

    .line 39
    .line 40
    invoke-virtual {p6}, Ll/lr2;->Q()Z

    .line 41
    .line 42
    .line 43
    move-result p6

    .line 44
    if-nez p6, :cond_2

    .line 45
    .line 46
    invoke-virtual {p9}, Ll/lr2;->s()I

    .line 47
    .line 48
    .line 49
    move-result p4

    .line 50
    invoke-virtual {p9}, Ll/lr2;->r()I

    .line 51
    .line 52
    .line 53
    move-result p5

    .line 54
    :cond_2
    move p7, p4

    .line 55
    move p8, p5

    .line 56
    move-object p4, p0

    .line 57
    iget-object p0, p4, Ll/a2d0;->J:Ll/a2d0;

    .line 58
    .line 59
    iget-object p5, p0, Ll/a2d0;->F:Ll/aij0;

    .line 60
    .line 61
    invoke-virtual {p0}, Ll/lr2;->v()Lcom/bumptech/glide/Priority;

    .line 62
    .line 63
    .line 64
    move-result-object p6

    .line 65
    iget-object p9, p4, Ll/a2d0;->J:Ll/a2d0;

    .line 66
    .line 67
    move-object p4, v0

    .line 68
    invoke-direct/range {p0 .. p10}, Ll/a2d0;->p0(Ljava/lang/Object;Ll/cli0;Ll/l2d0;Lcom/bumptech/glide/request/RequestCoordinator;Ll/aij0;Lcom/bumptech/glide/Priority;IILl/lr2;Ljava/util/concurrent/Executor;)Ll/y1d0;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {p4, v1, p0}, Lcom/bumptech/glide/request/a;->n(Ll/y1d0;Ll/y1d0;)V

    .line 73
    .line 74
    .line 75
    return-object p4
.end method

.method private q0(Ljava/lang/Object;Ll/cli0;Ll/l2d0;Lcom/bumptech/glide/request/RequestCoordinator;Ll/aij0;Lcom/bumptech/glide/Priority;IILl/lr2;Ljava/util/concurrent/Executor;)Ll/y1d0;
    .locals 16
    .param p4    # Lcom/bumptech/glide/request/RequestCoordinator;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ll/cli0<",
            "TTranscodeType;>;",
            "Ll/l2d0<",
            "TTranscodeType;>;",
            "Lcom/bumptech/glide/request/RequestCoordinator;",
            "Ll/aij0<",
            "*-TTranscodeType;>;",
            "Lcom/bumptech/glide/Priority;",
            "II",
            "Ll/lr2<",
            "*>;",
            "Ljava/util/concurrent/Executor;",
            ")",
            "Ll/y1d0;"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v5, p4

    .line 6
    .line 7
    move-object/from16 v7, p6

    .line 8
    .line 9
    iget-object v2, v0, Ll/a2d0;->I:Ll/a2d0;

    .line 10
    .line 11
    if-eqz v2, :cond_4

    .line 12
    .line 13
    iget-boolean v3, v0, Ll/a2d0;->N:Z

    .line 14
    .line 15
    if-nez v3, :cond_3

    .line 16
    .line 17
    iget-object v3, v2, Ll/a2d0;->F:Ll/aij0;

    .line 18
    .line 19
    iget-boolean v4, v2, Ll/a2d0;->L:Z

    .line 20
    .line 21
    if-eqz v4, :cond_0

    .line 22
    .line 23
    move-object/from16 v11, p5

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    move-object v11, v3

    .line 27
    :goto_0
    invoke-virtual {v2}, Ll/lr2;->G()Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-eqz v2, :cond_1

    .line 32
    .line 33
    iget-object v2, v0, Ll/a2d0;->I:Ll/a2d0;

    .line 34
    .line 35
    invoke-virtual {v2}, Ll/lr2;->v()Lcom/bumptech/glide/Priority;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    :goto_1
    move-object v12, v2

    .line 40
    goto :goto_2

    .line 41
    :cond_1
    invoke-direct {v0, v7}, Ll/a2d0;->s0(Lcom/bumptech/glide/Priority;)Lcom/bumptech/glide/Priority;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    goto :goto_1

    .line 46
    :goto_2
    iget-object v2, v0, Ll/a2d0;->I:Ll/a2d0;

    .line 47
    .line 48
    invoke-virtual {v2}, Ll/lr2;->s()I

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    iget-object v3, v0, Ll/a2d0;->I:Ll/a2d0;

    .line 53
    .line 54
    invoke-virtual {v3}, Ll/lr2;->r()I

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    invoke-static/range {p7 .. p8}, Ll/ylk0;->u(II)Z

    .line 59
    .line 60
    .line 61
    move-result v4

    .line 62
    if-eqz v4, :cond_2

    .line 63
    .line 64
    iget-object v4, v0, Ll/a2d0;->I:Ll/a2d0;

    .line 65
    .line 66
    invoke-virtual {v4}, Ll/lr2;->Q()Z

    .line 67
    .line 68
    .line 69
    move-result v4

    .line 70
    if-nez v4, :cond_2

    .line 71
    .line 72
    invoke-virtual/range {p9 .. p9}, Ll/lr2;->s()I

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    invoke-virtual/range {p9 .. p9}, Ll/lr2;->r()I

    .line 77
    .line 78
    .line 79
    move-result v3

    .line 80
    :cond_2
    move v13, v2

    .line 81
    move v14, v3

    .line 82
    new-instance v4, Lcom/bumptech/glide/request/b;

    .line 83
    .line 84
    invoke-direct {v4, v1, v5}, Lcom/bumptech/glide/request/b;-><init>(Ljava/lang/Object;Lcom/bumptech/glide/request/RequestCoordinator;)V

    .line 85
    .line 86
    .line 87
    move-object/from16 v2, p2

    .line 88
    .line 89
    move-object/from16 v3, p3

    .line 90
    .line 91
    move-object/from16 v6, p5

    .line 92
    .line 93
    move/from16 v8, p7

    .line 94
    .line 95
    move/from16 v9, p8

    .line 96
    .line 97
    move-object/from16 v10, p10

    .line 98
    .line 99
    move-object v5, v4

    .line 100
    move-object/from16 v4, p9

    .line 101
    .line 102
    invoke-direct/range {v0 .. v10}, Ll/a2d0;->F0(Ljava/lang/Object;Ll/cli0;Ll/l2d0;Ll/lr2;Lcom/bumptech/glide/request/RequestCoordinator;Ll/aij0;Lcom/bumptech/glide/Priority;IILjava/util/concurrent/Executor;)Ll/y1d0;

    .line 103
    .line 104
    .line 105
    move-result-object v15

    .line 106
    const/4 v1, 0x1

    .line 107
    iput-boolean v1, v0, Ll/a2d0;->N:Z

    .line 108
    .line 109
    move-object v1, v0

    .line 110
    iget-object v0, v1, Ll/a2d0;->I:Ll/a2d0;

    .line 111
    .line 112
    move-object v9, v0

    .line 113
    move-object v4, v5

    .line 114
    move-object v5, v11

    .line 115
    move-object v6, v12

    .line 116
    move v7, v13

    .line 117
    move v8, v14

    .line 118
    move-object v11, v1

    .line 119
    move-object/from16 v1, p1

    .line 120
    .line 121
    invoke-direct/range {v0 .. v10}, Ll/a2d0;->p0(Ljava/lang/Object;Ll/cli0;Ll/l2d0;Lcom/bumptech/glide/request/RequestCoordinator;Ll/aij0;Lcom/bumptech/glide/Priority;IILl/lr2;Ljava/util/concurrent/Executor;)Ll/y1d0;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    move-object v5, v4

    .line 126
    const/4 v1, 0x0

    .line 127
    iput-boolean v1, v11, Ll/a2d0;->N:Z

    .line 128
    .line 129
    invoke-virtual {v5, v15, v0}, Lcom/bumptech/glide/request/b;->m(Ll/y1d0;Ll/y1d0;)V

    .line 130
    .line 131
    .line 132
    return-object v5

    .line 133
    :cond_3
    const-string v0, "You cannot use a request as both the main request and a thumbnail, consider using clone() on the request(s) passed to thumbnail()"

    .line 134
    .line 135
    invoke-static {v0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    const/4 v0, 0x0

    .line 139
    return-object v0

    .line 140
    :cond_4
    move-object v11, v0

    .line 141
    iget-object v0, v11, Ll/a2d0;->K:Ljava/lang/Float;

    .line 142
    .line 143
    if-eqz v0, :cond_5

    .line 144
    .line 145
    new-instance v0, Lcom/bumptech/glide/request/b;

    .line 146
    .line 147
    invoke-direct {v0, v1, v5}, Lcom/bumptech/glide/request/b;-><init>(Ljava/lang/Object;Lcom/bumptech/glide/request/RequestCoordinator;)V

    .line 148
    .line 149
    .line 150
    move-object/from16 v2, p2

    .line 151
    .line 152
    move-object/from16 v3, p3

    .line 153
    .line 154
    move-object/from16 v6, p5

    .line 155
    .line 156
    move-object/from16 v7, p6

    .line 157
    .line 158
    move/from16 v8, p7

    .line 159
    .line 160
    move/from16 v9, p8

    .line 161
    .line 162
    move-object/from16 v4, p9

    .line 163
    .line 164
    move-object/from16 v10, p10

    .line 165
    .line 166
    move-object v5, v0

    .line 167
    move-object v0, v11

    .line 168
    invoke-direct/range {v0 .. v10}, Ll/a2d0;->F0(Ljava/lang/Object;Ll/cli0;Ll/l2d0;Ll/lr2;Lcom/bumptech/glide/request/RequestCoordinator;Ll/aij0;Lcom/bumptech/glide/Priority;IILjava/util/concurrent/Executor;)Ll/y1d0;

    .line 169
    .line 170
    .line 171
    move-result-object v11

    .line 172
    invoke-virtual/range {p9 .. p9}, Ll/lr2;->c()Ll/lr2;

    .line 173
    .line 174
    .line 175
    move-result-object v1

    .line 176
    iget-object v2, v0, Ll/a2d0;->K:Ljava/lang/Float;

    .line 177
    .line 178
    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    .line 179
    .line 180
    .line 181
    move-result v2

    .line 182
    invoke-virtual {v1, v2}, Ll/lr2;->f0(F)Ll/lr2;

    .line 183
    .line 184
    .line 185
    move-result-object v4

    .line 186
    invoke-direct {v0, v7}, Ll/a2d0;->s0(Lcom/bumptech/glide/Priority;)Lcom/bumptech/glide/Priority;

    .line 187
    .line 188
    .line 189
    move-result-object v7

    .line 190
    move-object/from16 v1, p1

    .line 191
    .line 192
    move-object/from16 v2, p2

    .line 193
    .line 194
    invoke-direct/range {v0 .. v10}, Ll/a2d0;->F0(Ljava/lang/Object;Ll/cli0;Ll/l2d0;Ll/lr2;Lcom/bumptech/glide/request/RequestCoordinator;Ll/aij0;Lcom/bumptech/glide/Priority;IILjava/util/concurrent/Executor;)Ll/y1d0;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    invoke-virtual {v5, v11, v0}, Lcom/bumptech/glide/request/b;->m(Ll/y1d0;Ll/y1d0;)V

    .line 199
    .line 200
    .line 201
    return-object v5

    .line 202
    :cond_5
    move-object/from16 v2, p2

    .line 203
    .line 204
    move-object/from16 v3, p3

    .line 205
    .line 206
    move-object/from16 v6, p5

    .line 207
    .line 208
    move-object/from16 v7, p6

    .line 209
    .line 210
    move/from16 v8, p7

    .line 211
    .line 212
    move/from16 v9, p8

    .line 213
    .line 214
    move-object/from16 v4, p9

    .line 215
    .line 216
    move-object/from16 v10, p10

    .line 217
    .line 218
    move-object v0, v11

    .line 219
    invoke-direct/range {v0 .. v10}, Ll/a2d0;->F0(Ljava/lang/Object;Ll/cli0;Ll/l2d0;Ll/lr2;Lcom/bumptech/glide/request/RequestCoordinator;Ll/aij0;Lcom/bumptech/glide/Priority;IILjava/util/concurrent/Executor;)Ll/y1d0;

    .line 220
    .line 221
    .line 222
    move-result-object v0

    .line 223
    return-object v0
.end method

.method private s0(Lcom/bumptech/glide/Priority;)Lcom/bumptech/glide/Priority;
    .locals 1
    .param p1    # Lcom/bumptech/glide/Priority;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    sget-object v0, Ll/a2d0$a;->b:[I

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    aget p1, v0, p1

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    if-eq p1, v0, :cond_3

    .line 11
    .line 12
    const/4 v0, 0x2

    .line 13
    if-eq p1, v0, :cond_2

    .line 14
    .line 15
    const/4 v0, 0x3

    .line 16
    if-eq p1, v0, :cond_1

    .line 17
    .line 18
    const/4 v0, 0x4

    .line 19
    if-ne p1, v0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const-string p1, "unknown priority: "

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/lr2;->v()Lcom/bumptech/glide/Priority;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-static {p1, p0}, Ll/yg3;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    const/4 p0, 0x0

    .line 32
    return-object p0

    .line 33
    :cond_1
    :goto_0
    sget-object p0, Lcom/bumptech/glide/Priority;->IMMEDIATE:Lcom/bumptech/glide/Priority;

    .line 34
    .line 35
    return-object p0

    .line 36
    :cond_2
    sget-object p0, Lcom/bumptech/glide/Priority;->HIGH:Lcom/bumptech/glide/Priority;

    .line 37
    .line 38
    return-object p0

    .line 39
    :cond_3
    sget-object p0, Lcom/bumptech/glide/Priority;->NORMAL:Lcom/bumptech/glide/Priority;

    .line 40
    .line 41
    return-object p0
.end method

.method private t0(Ljava/util/List;)V
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "CheckResult"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/l2d0<",
            "Ljava/lang/Object;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ll/l2d0;

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ll/a2d0;->m0(Ll/l2d0;)Ll/a2d0;

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    return-void
.end method

.method private w0(Ll/cli0;Ll/l2d0;Ll/lr2;Ljava/util/concurrent/Executor;)Ll/cli0;
    .locals 1
    .param p1    # Ll/cli0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ll/l2d0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<Y::",
            "Ll/cli0<",
            "TTranscodeType;>;>(TY;",
            "Ll/l2d0<",
            "TTranscodeType;>;",
            "Ll/lr2<",
            "*>;",
            "Ljava/util/concurrent/Executor;",
            ")TY;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/vn80;->d(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Ll/a2d0;->M:Z

    .line 5
    .line 6
    if-eqz v0, :cond_2

    .line 7
    .line 8
    invoke-direct {p0, p1, p2, p3, p4}, Ll/a2d0;->o0(Ll/cli0;Ll/l2d0;Ll/lr2;Ljava/util/concurrent/Executor;)Ll/y1d0;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    invoke-interface {p1}, Ll/cli0;->c()Ll/y1d0;

    .line 13
    .line 14
    .line 15
    move-result-object p4

    .line 16
    invoke-interface {p2, p4}, Ll/y1d0;->g(Ll/y1d0;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    invoke-direct {p0, p3, p4}, Ll/a2d0;->y0(Ll/lr2;Ll/y1d0;)Z

    .line 23
    .line 24
    .line 25
    move-result p3

    .line 26
    if-nez p3, :cond_1

    .line 27
    .line 28
    invoke-static {p4}, Ll/vn80;->d(Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    check-cast p0, Ll/y1d0;

    .line 33
    .line 34
    invoke-interface {p0}, Ll/y1d0;->isRunning()Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-nez p0, :cond_0

    .line 39
    .line 40
    invoke-interface {p4}, Ll/y1d0;->j()V

    .line 41
    .line 42
    .line 43
    :cond_0
    return-object p1

    .line 44
    :cond_1
    iget-object p3, p0, Ll/a2d0;->B:Ll/m2d0;

    .line 45
    .line 46
    invoke-virtual {p3, p1}, Ll/m2d0;->n(Ll/cli0;)V

    .line 47
    .line 48
    .line 49
    invoke-interface {p1, p2}, Ll/cli0;->g(Ll/y1d0;)V

    .line 50
    .line 51
    .line 52
    iget-object p0, p0, Ll/a2d0;->B:Ll/m2d0;

    .line 53
    .line 54
    invoke-virtual {p0, p1, p2}, Ll/m2d0;->z(Ll/cli0;Ll/y1d0;)V

    .line 55
    .line 56
    .line 57
    return-object p1

    .line 58
    :cond_2
    const-string p0, "You must call #load() before calling #into()"

    .line 59
    .line 60
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    const/4 p0, 0x0

    .line 64
    return-object p0
.end method

.method private y0(Ll/lr2;Ll/y1d0;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/lr2<",
            "*>;",
            "Ll/y1d0;",
            ")Z"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/lr2;->E()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p2}, Ll/y1d0;->isComplete()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method


# virtual methods
.method public A0(Ljava/io/File;)Ll/a2d0;
    .locals 0
    .param p1    # Ljava/io/File;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/CheckResult;
    .end annotation

    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            ")",
            "Ll/a2d0<",
            "TTranscodeType;>;"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/a2d0;->E0(Ljava/lang/Object;)Ll/a2d0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public B0(Ljava/lang/Integer;)Ll/a2d0;
    .locals 0
    .param p1    # Ljava/lang/Integer;
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation

        .annotation build Landroidx/annotation/Nullable;
        .end annotation

        .annotation build Landroidx/annotation/RawRes;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/CheckResult;
    .end annotation

    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Integer;",
            ")",
            "Ll/a2d0<",
            "TTranscodeType;>;"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/a2d0;->E0(Ljava/lang/Object;)Ll/a2d0;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p0, p0, Ll/a2d0;->A:Landroid/content/Context;

    .line 6
    .line 7
    invoke-static {p0}, Ll/do0;->c(Landroid/content/Context;)Ll/kzq;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Ll/p2d0;->o0(Ll/kzq;)Ll/p2d0;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p1, p0}, Ll/a2d0;->n0(Ll/lr2;)Ll/a2d0;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public C0(Ljava/lang/Object;)Ll/a2d0;
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/CheckResult;
    .end annotation

    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ll/a2d0<",
            "TTranscodeType;>;"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/a2d0;->E0(Ljava/lang/Object;)Ll/a2d0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public D0(Ljava/lang/String;)Ll/a2d0;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/CheckResult;
    .end annotation

    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ll/a2d0<",
            "TTranscodeType;>;"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/a2d0;->E0(Ljava/lang/Object;)Ll/a2d0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public G0()Ll/ndj;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ndj<",
            "TTranscodeType;>;"
        }
    .end annotation

    .line 1
    const/high16 v0, -0x80000000

    .line 2
    .line 3
    invoke-virtual {p0, v0, v0}, Ll/a2d0;->H0(II)Ll/ndj;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public H0(II)Ll/ndj;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Ll/ndj<",
            "TTranscodeType;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/e2d0;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2}, Ll/e2d0;-><init>(II)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/e7f;->a()Ljava/util/concurrent/Executor;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p0, v0, v0, p1}, Ll/a2d0;->v0(Ll/cli0;Ll/l2d0;Ljava/util/concurrent/Executor;)Ll/cli0;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    check-cast p0, Ll/ndj;

    .line 15
    .line 16
    return-object p0
.end method

.method public bridge synthetic a(Ll/lr2;)Ll/lr2;
    .locals 0
    .param p1    # Ll/lr2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/CheckResult;
    .end annotation

    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Ll/a2d0;->n0(Ll/lr2;)Ll/a2d0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic c()Ll/lr2;
    .locals 0
    .annotation build Landroidx/annotation/CheckResult;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/a2d0;->r0()Ll/a2d0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation build Landroidx/annotation/CheckResult;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/a2d0;->r0()Ll/a2d0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public m0(Ll/l2d0;)Ll/a2d0;
    .locals 1
    .param p1    # Ll/l2d0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/CheckResult;
    .end annotation

    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/l2d0<",
            "TTranscodeType;>;)",
            "Ll/a2d0<",
            "TTranscodeType;>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/lr2;->D()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/a2d0;->r0()Ll/a2d0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0, p1}, Ll/a2d0;->m0(Ll/l2d0;)Ll/a2d0;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    if-eqz p1, :cond_2

    .line 17
    .line 18
    iget-object v0, p0, Ll/a2d0;->H:Ljava/util/List;

    .line 19
    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    new-instance v0, Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Ll/a2d0;->H:Ljava/util/List;

    .line 28
    .line 29
    :cond_1
    iget-object v0, p0, Ll/a2d0;->H:Ljava/util/List;

    .line 30
    .line 31
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    :cond_2
    invoke-virtual {p0}, Ll/lr2;->c0()Ll/lr2;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    check-cast p0, Ll/a2d0;

    .line 39
    .line 40
    return-object p0
.end method

.method public n0(Ll/lr2;)Ll/a2d0;
    .locals 0
    .param p1    # Ll/lr2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/CheckResult;
    .end annotation

    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/lr2<",
            "*>;)",
            "Ll/a2d0<",
            "TTranscodeType;>;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/vn80;->d(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1}, Ll/lr2;->a(Ll/lr2;)Ll/lr2;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Ll/a2d0;

    .line 9
    .line 10
    return-object p0
.end method

.method public r0()Ll/a2d0;
    .locals 2
    .annotation build Landroidx/annotation/CheckResult;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/a2d0<",
            "TTranscodeType;>;"
        }
    .end annotation

    .line 1
    invoke-super {p0}, Ll/lr2;->c()Ll/lr2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/a2d0;

    .line 6
    .line 7
    iget-object v0, p0, Ll/a2d0;->F:Ll/aij0;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/aij0;->a()Ll/aij0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Ll/a2d0;->F:Ll/aij0;

    .line 14
    .line 15
    iget-object v0, p0, Ll/a2d0;->H:Ljava/util/List;

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    new-instance v0, Ljava/util/ArrayList;

    .line 20
    .line 21
    iget-object v1, p0, Ll/a2d0;->H:Ljava/util/List;

    .line 22
    .line 23
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Ll/a2d0;->H:Ljava/util/List;

    .line 27
    .line 28
    :cond_0
    iget-object v0, p0, Ll/a2d0;->I:Ll/a2d0;

    .line 29
    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    invoke-virtual {v0}, Ll/a2d0;->r0()Ll/a2d0;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iput-object v0, p0, Ll/a2d0;->I:Ll/a2d0;

    .line 37
    .line 38
    :cond_1
    iget-object v0, p0, Ll/a2d0;->J:Ll/a2d0;

    .line 39
    .line 40
    if-eqz v0, :cond_2

    .line 41
    .line 42
    invoke-virtual {v0}, Ll/a2d0;->r0()Ll/a2d0;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iput-object v0, p0, Ll/a2d0;->J:Ll/a2d0;

    .line 47
    .line 48
    :cond_2
    return-object p0
.end method

.method public u0(Ll/cli0;)Ll/cli0;
    .locals 2
    .param p1    # Ll/cli0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<Y::",
            "Ll/cli0<",
            "TTranscodeType;>;>(TY;)TY;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {}, Ll/e7f;->b()Ljava/util/concurrent/Executor;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    invoke-virtual {p0, p1, v0, v1}, Ll/a2d0;->v0(Ll/cli0;Ll/l2d0;Ljava/util/concurrent/Executor;)Ll/cli0;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public v0(Ll/cli0;Ll/l2d0;Ljava/util/concurrent/Executor;)Ll/cli0;
    .locals 0
    .param p1    # Ll/cli0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ll/l2d0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<Y::",
            "Ll/cli0<",
            "TTranscodeType;>;>(TY;",
            "Ll/l2d0<",
            "TTranscodeType;>;",
            "Ljava/util/concurrent/Executor;",
            ")TY;"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2, p0, p3}, Ll/a2d0;->w0(Ll/cli0;Ll/l2d0;Ll/lr2;Ljava/util/concurrent/Executor;)Ll/cli0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public x0(Landroid/widget/ImageView;)Ll/mml0;
    .locals 3
    .param p1    # Landroid/widget/ImageView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/ImageView;",
            ")",
            "Ll/mml0<",
            "Landroid/widget/ImageView;",
            "TTranscodeType;>;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/ylk0;->b()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/vn80;->d(Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/lr2;->P()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/lr2;->N()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p1}, Landroid/widget/ImageView;->getScaleType()Landroid/widget/ImageView$ScaleType;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    sget-object v0, Ll/a2d0$a;->a:[I

    .line 26
    .line 27
    invoke-virtual {p1}, Landroid/widget/ImageView;->getScaleType()Landroid/widget/ImageView$ScaleType;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    aget v0, v0, v1

    .line 36
    .line 37
    packed-switch v0, :pswitch_data_0

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :pswitch_0
    invoke-virtual {p0}, Ll/lr2;->c()Ll/lr2;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0}, Ll/lr2;->T()Ll/lr2;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    goto :goto_1

    .line 50
    :pswitch_1
    invoke-virtual {p0}, Ll/lr2;->c()Ll/lr2;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v0}, Ll/lr2;->U()Ll/lr2;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    goto :goto_1

    .line 59
    :pswitch_2
    invoke-virtual {p0}, Ll/lr2;->c()Ll/lr2;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {v0}, Ll/lr2;->T()Ll/lr2;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    goto :goto_1

    .line 68
    :pswitch_3
    invoke-virtual {p0}, Ll/lr2;->c()Ll/lr2;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {v0}, Ll/lr2;->S()Ll/lr2;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    goto :goto_1

    .line 77
    :cond_0
    :goto_0
    move-object v0, p0

    .line 78
    :goto_1
    iget-object v1, p0, Ll/a2d0;->E:Lcom/bumptech/glide/c;

    .line 79
    .line 80
    iget-object v2, p0, Ll/a2d0;->C:Ljava/lang/Class;

    .line 81
    .line 82
    invoke-virtual {v1, p1, v2}, Lcom/bumptech/glide/c;->a(Landroid/widget/ImageView;Ljava/lang/Class;)Ll/mml0;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    const/4 v1, 0x0

    .line 87
    invoke-static {}, Ll/e7f;->b()Ljava/util/concurrent/Executor;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    invoke-direct {p0, p1, v1, v0, v2}, Ll/a2d0;->w0(Ll/cli0;Ll/l2d0;Ll/lr2;Ljava/util/concurrent/Executor;)Ll/cli0;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    check-cast p0, Ll/mml0;

    .line 96
    .line 97
    return-object p0

    .line 98
    nop

    .line 99
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public z0(Ll/l2d0;)Ll/a2d0;
    .locals 1
    .param p1    # Ll/l2d0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/CheckResult;
    .end annotation

    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/l2d0<",
            "TTranscodeType;>;)",
            "Ll/a2d0<",
            "TTranscodeType;>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/lr2;->D()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/a2d0;->r0()Ll/a2d0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0, p1}, Ll/a2d0;->z0(Ll/l2d0;)Ll/a2d0;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    const/4 v0, 0x0

    .line 17
    iput-object v0, p0, Ll/a2d0;->H:Ljava/util/List;

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ll/a2d0;->m0(Ll/l2d0;)Ll/a2d0;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method
