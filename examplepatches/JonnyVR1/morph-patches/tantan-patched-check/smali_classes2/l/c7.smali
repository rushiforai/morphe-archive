.class public abstract Ll/c7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/lde;
.implements Ll/ytd$a;
.implements Ll/jmj$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/c7$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "INFO:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ll/lde;",
        "Ll/ytd$a;",
        "Ll/jmj$a;"
    }
.end annotation


# static fields
.field public static final w:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field public static final x:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field public static final y:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field


# instance fields
.field public final a:Lcom/facebook/drawee/components/DraweeEventTracker;

.field public final b:Ll/ytd;

.field public final c:Ljava/util/concurrent/Executor;

.field public d:Ll/i6d0;

.field public e:Ll/jmj;

.field public f:Ll/v36;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/v36<",
            "TINFO;>;"
        }
    .end annotation
.end field

.field public g:Ll/n2j;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/n2j<",
            "TINFO;>;"
        }
    .end annotation
.end field

.field public h:Ll/dve0;

.field public i:Landroid/graphics/drawable/Drawable;

.field public j:Ljava/lang/String;

.field public k:Ljava/lang/Object;

.field public l:Z

.field public m:Z

.field public n:Z

.field public o:Z

.field public p:Z

.field public q:Ljava/lang/String;

.field public r:Ll/i6c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/i6c<",
            "TT;>;"
        }
    .end annotation
.end field

.field public s:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field public t:Z

.field public u:Z

.field public v:Landroid/graphics/drawable/Drawable;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    const-string v0, "component_tag"

    .line 2
    .line 3
    const-string v1, "drawee"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/facebook/common/internal/ImmutableMap;->of(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sput-object v0, Ll/c7;->w:Ljava/util/Map;

    .line 10
    .line 11
    const-string v0, "origin_sub"

    .line 12
    .line 13
    const-string v1, "shortcut"

    .line 14
    .line 15
    const-string v2, "origin"

    .line 16
    .line 17
    const-string v3, "memory_bitmap"

    .line 18
    .line 19
    invoke-static {v2, v3, v0, v1}, Lcom/facebook/common/internal/ImmutableMap;->of(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sput-object v0, Ll/c7;->x:Ljava/util/Map;

    .line 24
    .line 25
    const-class v0, Ll/c7;

    .line 26
    .line 27
    sput-object v0, Ll/c7;->y:Ljava/lang/Class;

    .line 28
    .line 29
    return-void
.end method

.method public constructor <init>(Ll/ytd;Ljava/util/concurrent/Executor;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/facebook/drawee/components/DraweeEventTracker;->a()Lcom/facebook/drawee/components/DraweeEventTracker;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/c7;->a:Lcom/facebook/drawee/components/DraweeEventTracker;

    .line 9
    .line 10
    new-instance v0, Ll/n2j;

    .line 11
    .line 12
    invoke-direct {v0}, Ll/n2j;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Ll/c7;->g:Ll/n2j;

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    iput-boolean v0, p0, Ll/c7;->t:Z

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    iput-boolean v0, p0, Ll/c7;->u:Z

    .line 22
    .line 23
    iput-object p1, p0, Ll/c7;->b:Ll/ytd;

    .line 24
    .line 25
    iput-object p2, p0, Ll/c7;->c:Ljava/util/concurrent/Executor;

    .line 26
    .line 27
    invoke-virtual {p0, p3, p4}, Ll/c7;->B(Ljava/lang/String;Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public static bridge synthetic g(Ll/c7;Ljava/lang/String;Ll/i6c;Ljava/lang/Throwable;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/c7;->K(Ljava/lang/String;Ll/i6c;Ljava/lang/Throwable;Z)V

    return-void
.end method

.method public static bridge synthetic h(Ll/c7;Ljava/lang/String;Ll/i6c;Ljava/lang/Object;FZZZ)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p7}, Ll/c7;->M(Ljava/lang/String;Ll/i6c;Ljava/lang/Object;FZZZ)V

    return-void
.end method

.method public static bridge synthetic i(Ll/c7;Ljava/lang/String;Ll/i6c;FZ)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/c7;->N(Ljava/lang/String;Ll/i6c;FZ)V

    return-void
.end method


# virtual methods
.method public final A()Ll/dve0;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/c7;->h:Ll/dve0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-object v0

    .line 6
    :cond_0
    const-string v0, "mSettableDraweeHierarchy is null; Caller context: "

    .line 7
    .line 8
    iget-object p0, p0, Ll/c7;->k:Ljava/lang/Object;

    .line 9
    .line 10
    invoke-static {v0, p0}, Ll/qg50;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    return-object p0
.end method

.method public final declared-synchronized B(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-static {}, Ll/i9j;->d()Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    const-string v0, "AbstractDraweeController#init"

    .line 9
    .line 10
    invoke-static {v0}, Ll/i9j;->a(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :catchall_0
    move-exception p1

    .line 15
    goto/16 :goto_2

    .line 16
    .line 17
    :cond_0
    :goto_0
    iget-object v0, p0, Ll/c7;->a:Lcom/facebook/drawee/components/DraweeEventTracker;

    .line 18
    .line 19
    sget-object v1, Lcom/facebook/drawee/components/DraweeEventTracker$Event;->ON_INIT_CONTROLLER:Lcom/facebook/drawee/components/DraweeEventTracker$Event;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Lcom/facebook/drawee/components/DraweeEventTracker;->b(Lcom/facebook/drawee/components/DraweeEventTracker$Event;)V

    .line 22
    .line 23
    .line 24
    iget-boolean v0, p0, Ll/c7;->t:Z

    .line 25
    .line 26
    if-nez v0, :cond_1

    .line 27
    .line 28
    iget-object v0, p0, Ll/c7;->b:Ll/ytd;

    .line 29
    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    invoke-virtual {v0, p0}, Ll/ytd;->a(Ll/ytd$a;)V

    .line 33
    .line 34
    .line 35
    :cond_1
    const/4 v0, 0x0

    .line 36
    iput-boolean v0, p0, Ll/c7;->l:Z

    .line 37
    .line 38
    iput-boolean v0, p0, Ll/c7;->n:Z

    .line 39
    .line 40
    invoke-virtual {p0}, Ll/c7;->P()V

    .line 41
    .line 42
    .line 43
    iput-boolean v0, p0, Ll/c7;->p:Z

    .line 44
    .line 45
    iget-object v0, p0, Ll/c7;->d:Ll/i6d0;

    .line 46
    .line 47
    if-eqz v0, :cond_2

    .line 48
    .line 49
    invoke-virtual {v0}, Ll/i6d0;->a()V

    .line 50
    .line 51
    .line 52
    :cond_2
    iget-object v0, p0, Ll/c7;->e:Ll/jmj;

    .line 53
    .line 54
    if-eqz v0, :cond_3

    .line 55
    .line 56
    invoke-virtual {v0}, Ll/jmj;->a()V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Ll/c7;->e:Ll/jmj;

    .line 60
    .line 61
    invoke-virtual {v0, p0}, Ll/jmj;->f(Ll/jmj$a;)V

    .line 62
    .line 63
    .line 64
    :cond_3
    iget-object v0, p0, Ll/c7;->f:Ll/v36;

    .line 65
    .line 66
    instance-of v1, v0, Ll/c7$b;

    .line 67
    .line 68
    const/4 v2, 0x0

    .line 69
    if-eqz v1, :cond_4

    .line 70
    .line 71
    check-cast v0, Ll/c7$b;

    .line 72
    .line 73
    invoke-virtual {v0}, Ll/o2j;->h()V

    .line 74
    .line 75
    .line 76
    goto :goto_1

    .line 77
    :cond_4
    iput-object v2, p0, Ll/c7;->f:Ll/v36;

    .line 78
    .line 79
    :goto_1
    iget-object v0, p0, Ll/c7;->h:Ll/dve0;

    .line 80
    .line 81
    if-eqz v0, :cond_5

    .line 82
    .line 83
    invoke-interface {v0}, Ll/dve0;->reset()V

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Ll/c7;->h:Ll/dve0;

    .line 87
    .line 88
    invoke-interface {v0, v2}, Ll/dve0;->c(Landroid/graphics/drawable/Drawable;)V

    .line 89
    .line 90
    .line 91
    iput-object v2, p0, Ll/c7;->h:Ll/dve0;

    .line 92
    .line 93
    :cond_5
    iput-object v2, p0, Ll/c7;->i:Landroid/graphics/drawable/Drawable;

    .line 94
    .line 95
    const/4 v0, 0x2

    .line 96
    invoke-static {v0}, Ll/huf;->m(I)Z

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    if-eqz v0, :cond_6

    .line 101
    .line 102
    sget-object v0, Ll/c7;->y:Ljava/lang/Class;

    .line 103
    .line 104
    const-string v1, "controller %x %s -> %s: initialize"

    .line 105
    .line 106
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 107
    .line 108
    .line 109
    move-result v2

    .line 110
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 111
    .line 112
    .line 113
    move-result-object v2

    .line 114
    iget-object v3, p0, Ll/c7;->j:Ljava/lang/String;

    .line 115
    .line 116
    invoke-static {v0, v1, v2, v3, p1}, Ll/huf;->q(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 117
    .line 118
    .line 119
    :cond_6
    iput-object p1, p0, Ll/c7;->j:Ljava/lang/String;

    .line 120
    .line 121
    iput-object p2, p0, Ll/c7;->k:Ljava/lang/Object;

    .line 122
    .line 123
    invoke-static {}, Ll/i9j;->d()Z

    .line 124
    .line 125
    .line 126
    move-result p1

    .line 127
    if-eqz p1, :cond_7

    .line 128
    .line 129
    invoke-static {}, Ll/i9j;->b()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 130
    .line 131
    .line 132
    :cond_7
    monitor-exit p0

    .line 133
    return-void

    .line 134
    :goto_2
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 135
    throw p1
.end method

.method public C(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/c7;->B(Ljava/lang/String;Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Ll/c7;->t:Z

    .line 6
    .line 7
    iput-boolean p1, p0, Ll/c7;->u:Z

    .line 8
    .line 9
    return-void
.end method

.method public final D(Ljava/lang/String;Ll/i6c;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ll/i6c<",
            "TT;>;)Z"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    if-nez p2, :cond_0

    .line 3
    .line 4
    iget-object v1, p0, Ll/c7;->r:Ll/i6c;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    iget-object v1, p0, Ll/c7;->j:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    iget-object p1, p0, Ll/c7;->r:Ll/i6c;

    .line 18
    .line 19
    if-ne p2, p1, :cond_1

    .line 20
    .line 21
    iget-boolean p0, p0, Ll/c7;->m:Z

    .line 22
    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    return v0

    .line 26
    :cond_1
    const/4 p0, 0x0

    .line 27
    return p0
.end method

.method public E()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/c7;->u:Z

    .line 2
    .line 3
    return p0
.end method

.method public final F(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 7

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-static {v0}, Ll/huf;->m(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    sget-object v1, Ll/c7;->y:Ljava/lang/Class;

    .line 9
    .line 10
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    iget-object v4, p0, Ll/c7;->j:Ljava/lang/String;

    .line 19
    .line 20
    const-string v2, "controller %x %s: %s: failure: %s"

    .line 21
    .line 22
    move-object v5, p1

    .line 23
    move-object v6, p2

    .line 24
    invoke-static/range {v1 .. v6}, Ll/huf;->r(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public final G(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "TT;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-static {v0}, Ll/huf;->m(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    sget-object v0, Ll/c7;->y:Ljava/lang/Class;

    .line 9
    .line 10
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iget-object v2, p0, Ll/c7;->j:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {p0, p2}, Ll/c7;->v(Ljava/lang/Object;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    invoke-virtual {p0, p2}, Ll/c7;->w(Ljava/lang/Object;)I

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    filled-new-array {v1, v2, p1, v3, p0}, [Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    const-string p1, "controller %x %s: %s: image: %s %x"

    .line 37
    .line 38
    invoke-static {v0, p1, p0}, Ll/huf;->s(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    :cond_0
    return-void
.end method

.method public final H(Ljava/util/Map;Ljava/util/Map;Landroid/net/Uri;)Ll/u36$a;
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Landroid/net/Uri;",
            ")",
            "Ll/u36$a;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/c7;->h:Ll/dve0;

    .line 2
    .line 3
    instance-of v1, v0, Ll/wlj;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    check-cast v0, Ll/wlj;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/wlj;->n()Ll/h1e0;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0}, Ll/wlj;->m()Landroid/graphics/PointF;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    move-object v8, v0

    .line 22
    move-object v7, v1

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 v1, 0x0

    .line 25
    move-object v7, v1

    .line 26
    move-object v8, v7

    .line 27
    :goto_0
    sget-object v2, Ll/c7;->w:Ljava/util/Map;

    .line 28
    .line 29
    sget-object v3, Ll/c7;->x:Ljava/util/Map;

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/c7;->s()Landroid/graphics/Rect;

    .line 32
    .line 33
    .line 34
    move-result-object v6

    .line 35
    invoke-virtual {p0}, Ll/c7;->n()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v10

    .line 39
    invoke-virtual {p0}, Ll/c7;->E()Z

    .line 40
    .line 41
    .line 42
    move-result v11

    .line 43
    const/4 v5, 0x0

    .line 44
    move-object v4, p1

    .line 45
    move-object v9, p2

    .line 46
    move-object/from16 v12, p3

    .line 47
    .line 48
    invoke-static/range {v2 .. v12}, Ll/ta00;->a(Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;Landroid/graphics/Rect;Ljava/lang/String;Landroid/graphics/PointF;Ljava/util/Map;Ljava/lang/Object;ZLandroid/net/Uri;)Ll/u36$a;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    return-object p0
.end method

.method public final I(Ll/i6c;Ljava/lang/Object;Landroid/net/Uri;)Ll/u36$a;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/i6c<",
            "TT;>;TINFO;",
            "Landroid/net/Uri;",
            ")",
            "Ll/u36$a;"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    invoke-interface {p1}, Ll/i6c;->getExtras()Ljava/util/Map;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    :goto_0
    invoke-virtual {p0, p2}, Ll/c7;->J(Ljava/lang/Object;)Ljava/util/Map;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    invoke-virtual {p0, p1, p2, p3}, Ll/c7;->H(Ljava/util/Map;Ljava/util/Map;Landroid/net/Uri;)Ll/u36$a;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public abstract J(Ljava/lang/Object;)Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TINFO;)",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end method

.method public final K(Ljava/lang/String;Ll/i6c;Ljava/lang/Throwable;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ll/i6c<",
            "TT;>;",
            "Ljava/lang/Throwable;",
            "Z)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/i9j;->d()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "AbstractDraweeController#onFailureInternal"

    .line 8
    .line 9
    invoke-static {v0}, Ll/i9j;->a(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    invoke-virtual {p0, p1, p2}, Ll/c7;->D(Ljava/lang/String;Ll/i6c;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-nez p1, :cond_1

    .line 17
    .line 18
    const-string p1, "ignore_old_datasource @ onFailure"

    .line 19
    .line 20
    invoke-virtual {p0, p1, p3}, Ll/c7;->F(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 21
    .line 22
    .line 23
    invoke-interface {p2}, Ll/i6c;->close()Z

    .line 24
    .line 25
    .line 26
    invoke-static {}, Ll/i9j;->d()Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    if-eqz p0, :cond_7

    .line 31
    .line 32
    invoke-static {}, Ll/i9j;->b()V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_1
    iget-object p1, p0, Ll/c7;->a:Lcom/facebook/drawee/components/DraweeEventTracker;

    .line 37
    .line 38
    if-eqz p4, :cond_2

    .line 39
    .line 40
    sget-object v0, Lcom/facebook/drawee/components/DraweeEventTracker$Event;->ON_DATASOURCE_FAILURE:Lcom/facebook/drawee/components/DraweeEventTracker$Event;

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_2
    sget-object v0, Lcom/facebook/drawee/components/DraweeEventTracker$Event;->ON_DATASOURCE_FAILURE_INT:Lcom/facebook/drawee/components/DraweeEventTracker$Event;

    .line 44
    .line 45
    :goto_0
    invoke-virtual {p1, v0}, Lcom/facebook/drawee/components/DraweeEventTracker;->b(Lcom/facebook/drawee/components/DraweeEventTracker$Event;)V

    .line 46
    .line 47
    .line 48
    if-eqz p4, :cond_6

    .line 49
    .line 50
    const-string p1, "final_failed @ onFailure"

    .line 51
    .line 52
    invoke-virtual {p0, p1, p3}, Ll/c7;->F(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 53
    .line 54
    .line 55
    const/4 p1, 0x0

    .line 56
    iput-object p1, p0, Ll/c7;->r:Ll/i6c;

    .line 57
    .line 58
    const/4 p1, 0x1

    .line 59
    iput-boolean p1, p0, Ll/c7;->o:Z

    .line 60
    .line 61
    iget-object p4, p0, Ll/c7;->h:Ll/dve0;

    .line 62
    .line 63
    if-eqz p4, :cond_5

    .line 64
    .line 65
    iget-boolean v0, p0, Ll/c7;->p:Z

    .line 66
    .line 67
    if-eqz v0, :cond_3

    .line 68
    .line 69
    iget-object v0, p0, Ll/c7;->v:Landroid/graphics/drawable/Drawable;

    .line 70
    .line 71
    if-eqz v0, :cond_3

    .line 72
    .line 73
    const/high16 v1, 0x3f800000    # 1.0f

    .line 74
    .line 75
    invoke-interface {p4, v0, v1, p1}, Ll/dve0;->f(Landroid/graphics/drawable/Drawable;FZ)V

    .line 76
    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_3
    invoke-virtual {p0}, Ll/c7;->f0()Z

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    if-eqz p1, :cond_4

    .line 84
    .line 85
    invoke-interface {p4, p3}, Ll/dve0;->a(Ljava/lang/Throwable;)V

    .line 86
    .line 87
    .line 88
    goto :goto_1

    .line 89
    :cond_4
    invoke-interface {p4, p3}, Ll/dve0;->d(Ljava/lang/Throwable;)V

    .line 90
    .line 91
    .line 92
    :cond_5
    :goto_1
    invoke-virtual {p0, p3, p2}, Ll/c7;->S(Ljava/lang/Throwable;Ll/i6c;)V

    .line 93
    .line 94
    .line 95
    goto :goto_2

    .line 96
    :cond_6
    const-string p1, "intermediate_failed @ onFailure"

    .line 97
    .line 98
    invoke-virtual {p0, p1, p3}, Ll/c7;->F(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {p0, p3}, Ll/c7;->T(Ljava/lang/Throwable;)V

    .line 102
    .line 103
    .line 104
    :goto_2
    invoke-static {}, Ll/i9j;->d()Z

    .line 105
    .line 106
    .line 107
    move-result p0

    .line 108
    if-eqz p0, :cond_7

    .line 109
    .line 110
    invoke-static {}, Ll/i9j;->b()V

    .line 111
    .line 112
    .line 113
    :cond_7
    return-void
.end method

.method public L(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "TT;)V"
        }
    .end annotation

    .line 1
    return-void
.end method

.method public final M(Ljava/lang/String;Ll/i6c;Ljava/lang/Object;FZZZ)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ll/i6c<",
            "TT;>;TT;FZZZ)V"
        }
    .end annotation

    .line 1
    :try_start_0
    invoke-static {}, Ll/i9j;->d()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "AbstractDraweeController#onNewResultInternal"

    .line 8
    .line 9
    invoke-static {v0}, Ll/i9j;->a(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    invoke-virtual {p0, p1, p2}, Ll/c7;->D(Ljava/lang/String;Ll/i6c;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    const-string p1, "ignore_old_datasource @ onNewResult"

    .line 19
    .line 20
    invoke-virtual {p0, p1, p3}, Ll/c7;->G(Ljava/lang/String;Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, p3}, Ll/c7;->Q(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    invoke-interface {p2}, Ll/i6c;->close()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 27
    .line 28
    .line 29
    invoke-static {}, Ll/i9j;->d()Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-eqz p0, :cond_9

    .line 34
    .line 35
    invoke-static {}, Ll/i9j;->b()V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_1
    :try_start_1
    iget-object v0, p0, Ll/c7;->a:Lcom/facebook/drawee/components/DraweeEventTracker;

    .line 40
    .line 41
    if-eqz p5, :cond_2

    .line 42
    .line 43
    sget-object v1, Lcom/facebook/drawee/components/DraweeEventTracker$Event;->ON_DATASOURCE_RESULT:Lcom/facebook/drawee/components/DraweeEventTracker$Event;

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_2
    sget-object v1, Lcom/facebook/drawee/components/DraweeEventTracker$Event;->ON_DATASOURCE_RESULT_INT:Lcom/facebook/drawee/components/DraweeEventTracker$Event;

    .line 47
    .line 48
    :goto_0
    invoke-virtual {v0, v1}, Lcom/facebook/drawee/components/DraweeEventTracker;->b(Lcom/facebook/drawee/components/DraweeEventTracker$Event;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 49
    .line 50
    .line 51
    :try_start_2
    invoke-virtual {p0, p3}, Ll/c7;->l(Ljava/lang/Object;)Landroid/graphics/drawable/Drawable;

    .line 52
    .line 53
    .line 54
    move-result-object v0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 55
    :try_start_3
    iget-object v1, p0, Ll/c7;->s:Ljava/lang/Object;

    .line 56
    .line 57
    iget-object v2, p0, Ll/c7;->v:Landroid/graphics/drawable/Drawable;

    .line 58
    .line 59
    iput-object p3, p0, Ll/c7;->s:Ljava/lang/Object;

    .line 60
    .line 61
    iput-object v0, p0, Ll/c7;->v:Landroid/graphics/drawable/Drawable;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 62
    .line 63
    const-string v3, "release_previous_result @ onNewResult"

    .line 64
    .line 65
    const/high16 v4, 0x3f800000    # 1.0f

    .line 66
    .line 67
    if-eqz p5, :cond_3

    .line 68
    .line 69
    :try_start_4
    const-string p4, "set_final_result @ onNewResult"

    .line 70
    .line 71
    invoke-virtual {p0, p4, p3}, Ll/c7;->G(Ljava/lang/String;Ljava/lang/Object;)V

    .line 72
    .line 73
    .line 74
    const/4 p4, 0x0

    .line 75
    iput-object p4, p0, Ll/c7;->r:Ll/i6c;

    .line 76
    .line 77
    invoke-virtual {p0}, Ll/c7;->A()Ll/dve0;

    .line 78
    .line 79
    .line 80
    move-result-object p4

    .line 81
    invoke-interface {p4, v0, v4, p6}, Ll/dve0;->f(Landroid/graphics/drawable/Drawable;FZ)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p0, p1, p3, p2}, Ll/c7;->X(Ljava/lang/String;Ljava/lang/Object;Ll/i6c;)V

    .line 85
    .line 86
    .line 87
    goto :goto_1

    .line 88
    :catchall_0
    move-exception p1

    .line 89
    goto :goto_2

    .line 90
    :cond_3
    if-eqz p7, :cond_4

    .line 91
    .line 92
    const-string p4, "set_temporary_result @ onNewResult"

    .line 93
    .line 94
    invoke-virtual {p0, p4, p3}, Ll/c7;->G(Ljava/lang/String;Ljava/lang/Object;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {p0}, Ll/c7;->A()Ll/dve0;

    .line 98
    .line 99
    .line 100
    move-result-object p4

    .line 101
    invoke-interface {p4, v0, v4, p6}, Ll/dve0;->f(Landroid/graphics/drawable/Drawable;FZ)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {p0, p1, p3, p2}, Ll/c7;->X(Ljava/lang/String;Ljava/lang/Object;Ll/i6c;)V

    .line 105
    .line 106
    .line 107
    goto :goto_1

    .line 108
    :cond_4
    const-string p2, "set_intermediate_result @ onNewResult"

    .line 109
    .line 110
    invoke-virtual {p0, p2, p3}, Ll/c7;->G(Ljava/lang/String;Ljava/lang/Object;)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {p0}, Ll/c7;->A()Ll/dve0;

    .line 114
    .line 115
    .line 116
    move-result-object p2

    .line 117
    invoke-interface {p2, v0, p4, p6}, Ll/dve0;->f(Landroid/graphics/drawable/Drawable;FZ)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {p0, p1, p3}, Ll/c7;->U(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 121
    .line 122
    .line 123
    :goto_1
    if-eqz v2, :cond_5

    .line 124
    .line 125
    if-eq v2, v0, :cond_5

    .line 126
    .line 127
    :try_start_5
    invoke-virtual {p0, v2}, Ll/c7;->O(Landroid/graphics/drawable/Drawable;)V

    .line 128
    .line 129
    .line 130
    :cond_5
    if-eqz v1, :cond_6

    .line 131
    .line 132
    if-eq v1, p3, :cond_6

    .line 133
    .line 134
    invoke-virtual {p0, v3, v1}, Ll/c7;->G(Ljava/lang/String;Ljava/lang/Object;)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {p0, v1}, Ll/c7;->Q(Ljava/lang/Object;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 138
    .line 139
    .line 140
    :cond_6
    invoke-static {}, Ll/i9j;->d()Z

    .line 141
    .line 142
    .line 143
    move-result p0

    .line 144
    if-eqz p0, :cond_9

    .line 145
    .line 146
    invoke-static {}, Ll/i9j;->b()V

    .line 147
    .line 148
    .line 149
    return-void

    .line 150
    :goto_2
    if-eqz v2, :cond_7

    .line 151
    .line 152
    if-eq v2, v0, :cond_7

    .line 153
    .line 154
    :try_start_6
    invoke-virtual {p0, v2}, Ll/c7;->O(Landroid/graphics/drawable/Drawable;)V

    .line 155
    .line 156
    .line 157
    :cond_7
    if-eqz v1, :cond_8

    .line 158
    .line 159
    if-eq v1, p3, :cond_8

    .line 160
    .line 161
    invoke-virtual {p0, v3, v1}, Ll/c7;->G(Ljava/lang/String;Ljava/lang/Object;)V

    .line 162
    .line 163
    .line 164
    invoke-virtual {p0, v1}, Ll/c7;->Q(Ljava/lang/Object;)V

    .line 165
    .line 166
    .line 167
    :cond_8
    throw p1

    .line 168
    :catch_0
    move-exception p4

    .line 169
    const-string p6, "drawable_failed @ onNewResult"

    .line 170
    .line 171
    invoke-virtual {p0, p6, p3}, Ll/c7;->G(Ljava/lang/String;Ljava/lang/Object;)V

    .line 172
    .line 173
    .line 174
    invoke-virtual {p0, p3}, Ll/c7;->Q(Ljava/lang/Object;)V

    .line 175
    .line 176
    .line 177
    invoke-virtual {p0, p1, p2, p4, p5}, Ll/c7;->K(Ljava/lang/String;Ll/i6c;Ljava/lang/Throwable;Z)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 178
    .line 179
    .line 180
    invoke-static {}, Ll/i9j;->d()Z

    .line 181
    .line 182
    .line 183
    move-result p0

    .line 184
    if-eqz p0, :cond_9

    .line 185
    .line 186
    invoke-static {}, Ll/i9j;->b()V

    .line 187
    .line 188
    .line 189
    :cond_9
    return-void

    .line 190
    :catchall_1
    move-exception p0

    .line 191
    invoke-static {}, Ll/i9j;->d()Z

    .line 192
    .line 193
    .line 194
    move-result p1

    .line 195
    if-eqz p1, :cond_a

    .line 196
    .line 197
    invoke-static {}, Ll/i9j;->b()V

    .line 198
    .line 199
    .line 200
    :cond_a
    throw p0
.end method

.method public final N(Ljava/lang/String;Ll/i6c;FZ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ll/i6c<",
            "TT;>;FZ)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/c7;->D(Ljava/lang/String;Ll/i6c;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    const-string p1, "ignore_old_datasource @ onProgress"

    .line 8
    .line 9
    const/4 p3, 0x0

    .line 10
    invoke-virtual {p0, p1, p3}, Ll/c7;->F(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 11
    .line 12
    .line 13
    invoke-interface {p2}, Ll/i6c;->close()Z

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    if-nez p4, :cond_1

    .line 18
    .line 19
    iget-object p0, p0, Ll/c7;->h:Ll/dve0;

    .line 20
    .line 21
    const/4 p1, 0x0

    .line 22
    invoke-interface {p0, p3, p1}, Ll/dve0;->e(FZ)V

    .line 23
    .line 24
    .line 25
    :cond_1
    return-void
.end method

.method public abstract O(Landroid/graphics/drawable/Drawable;)V
.end method

.method public final P()V
    .locals 6

    .line 1
    iget-boolean v0, p0, Ll/c7;->m:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iput-boolean v1, p0, Ll/c7;->m:Z

    .line 5
    .line 6
    iput-boolean v1, p0, Ll/c7;->o:Z

    .line 7
    .line 8
    iget-object v1, p0, Ll/c7;->r:Ll/i6c;

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-interface {v1}, Ll/i6c;->getExtras()Ljava/util/Map;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iget-object v3, p0, Ll/c7;->r:Ll/i6c;

    .line 18
    .line 19
    invoke-interface {v3}, Ll/i6c;->close()Z

    .line 20
    .line 21
    .line 22
    iput-object v2, p0, Ll/c7;->r:Ll/i6c;

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    move-object v1, v2

    .line 26
    :goto_0
    iget-object v3, p0, Ll/c7;->v:Landroid/graphics/drawable/Drawable;

    .line 27
    .line 28
    if-eqz v3, :cond_1

    .line 29
    .line 30
    invoke-virtual {p0, v3}, Ll/c7;->O(Landroid/graphics/drawable/Drawable;)V

    .line 31
    .line 32
    .line 33
    :cond_1
    iget-object v3, p0, Ll/c7;->q:Ljava/lang/String;

    .line 34
    .line 35
    if-eqz v3, :cond_2

    .line 36
    .line 37
    iput-object v2, p0, Ll/c7;->q:Ljava/lang/String;

    .line 38
    .line 39
    :cond_2
    iput-object v2, p0, Ll/c7;->v:Landroid/graphics/drawable/Drawable;

    .line 40
    .line 41
    iget-object v3, p0, Ll/c7;->s:Ljava/lang/Object;

    .line 42
    .line 43
    if-eqz v3, :cond_3

    .line 44
    .line 45
    invoke-virtual {p0, v3}, Ll/c7;->x(Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    invoke-virtual {p0, v3}, Ll/c7;->J(Ljava/lang/Object;)Ljava/util/Map;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    const-string v4, "release"

    .line 54
    .line 55
    iget-object v5, p0, Ll/c7;->s:Ljava/lang/Object;

    .line 56
    .line 57
    invoke-virtual {p0, v4, v5}, Ll/c7;->G(Ljava/lang/String;Ljava/lang/Object;)V

    .line 58
    .line 59
    .line 60
    iget-object v4, p0, Ll/c7;->s:Ljava/lang/Object;

    .line 61
    .line 62
    invoke-virtual {p0, v4}, Ll/c7;->Q(Ljava/lang/Object;)V

    .line 63
    .line 64
    .line 65
    iput-object v2, p0, Ll/c7;->s:Ljava/lang/Object;

    .line 66
    .line 67
    move-object v2, v3

    .line 68
    :cond_3
    if-eqz v0, :cond_4

    .line 69
    .line 70
    invoke-virtual {p0, v1, v2}, Ll/c7;->V(Ljava/util/Map;Ljava/util/Map;)V

    .line 71
    .line 72
    .line 73
    :cond_4
    return-void
.end method

.method public abstract Q(Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation
.end method

.method public R(Ll/u36;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/u36<",
            "TINFO;>;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/c7;->g:Ll/n2j;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/n2j;->m(Ll/u36;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final S(Ljava/lang/Throwable;Ll/i6c;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Throwable;",
            "Ll/i6c<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p2, v0, v0}, Ll/c7;->I(Ll/i6c;Ljava/lang/Object;Landroid/net/Uri;)Ll/u36$a;

    .line 3
    .line 4
    .line 5
    move-result-object p2

    .line 6
    invoke-virtual {p0}, Ll/c7;->o()Ll/v36;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object v1, p0, Ll/c7;->j:Ljava/lang/String;

    .line 11
    .line 12
    invoke-interface {v0, v1, p1}, Ll/v36;->d(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ll/c7;->p()Ll/u36;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object p0, p0, Ll/c7;->j:Ljava/lang/String;

    .line 20
    .line 21
    invoke-interface {v0, p0, p1, p2}, Ll/u36;->d(Ljava/lang/String;Ljava/lang/Throwable;Ll/u36$a;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final T(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/c7;->o()Ll/v36;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/c7;->j:Ljava/lang/String;

    .line 6
    .line 7
    invoke-interface {v0, v1, p1}, Ll/v36;->f(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/c7;->p()Ll/u36;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iget-object p0, p0, Ll/c7;->j:Ljava/lang/String;

    .line 15
    .line 16
    invoke-interface {p1, p0}, Ll/u36;->e(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final U(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "TT;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p2}, Ll/c7;->x(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p0}, Ll/c7;->o()Ll/v36;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0, p1, p2}, Ll/v36;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ll/c7;->p()Ll/u36;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-interface {p0, p1, p2}, Ll/u36;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final V(Ljava/util/Map;Ljava/util/Map;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/c7;->o()Ll/v36;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/c7;->j:Ljava/lang/String;

    .line 6
    .line 7
    invoke-interface {v0, v1}, Ll/v36;->a(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/c7;->p()Ll/u36;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v1, p0, Ll/c7;->j:Ljava/lang/String;

    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    invoke-virtual {p0, p1, p2, v2}, Ll/c7;->H(Ljava/util/Map;Ljava/util/Map;Landroid/net/Uri;)Ll/u36$a;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-interface {v0, v1, p0}, Ll/u36;->j(Ljava/lang/String;Ll/u36$a;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public W(Ll/i6c;Ljava/lang/Object;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/i6c<",
            "TT;>;TINFO;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/c7;->o()Ll/v36;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/c7;->j:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v2, p0, Ll/c7;->k:Ljava/lang/Object;

    .line 8
    .line 9
    invoke-interface {v0, v1, v2}, Ll/v36;->c(Ljava/lang/String;Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ll/c7;->p()Ll/u36;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v1, p0, Ll/c7;->j:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v2, p0, Ll/c7;->k:Ljava/lang/Object;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/c7;->y()Landroid/net/Uri;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    invoke-virtual {p0, p1, p2, v3}, Ll/c7;->I(Ll/i6c;Ljava/lang/Object;Landroid/net/Uri;)Ll/u36$a;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-interface {v0, v1, v2, p0}, Ll/u36;->i(Ljava/lang/String;Ljava/lang/Object;Ll/u36$a;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final X(Ljava/lang/String;Ljava/lang/Object;Ll/i6c;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "TT;",
            "Ll/i6c<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p2}, Ll/c7;->x(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p0}, Ll/c7;->o()Ll/v36;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Ll/c7;->f()Landroid/graphics/drawable/Animatable;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-interface {v0, p1, p2, v1}, Ll/v36;->e(Ljava/lang/String;Ljava/lang/Object;Landroid/graphics/drawable/Animatable;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ll/c7;->p()Ll/u36;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const/4 v1, 0x0

    .line 21
    invoke-virtual {p0, p3, p2, v1}, Ll/c7;->I(Ll/i6c;Ljava/lang/Object;Landroid/net/Uri;)Ll/u36$a;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-interface {v0, p1, p2, p0}, Ll/u36;->h(Ljava/lang/String;Ljava/lang/Object;Ll/u36$a;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public Y(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/c7;->q:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public Z(Landroid/graphics/drawable/Drawable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/c7;->i:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    iget-object p0, p0, Ll/c7;->h:Ll/dve0;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/dve0;->c(Landroid/graphics/drawable/Drawable;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public a()Z
    .locals 4

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-static {v0}, Ll/huf;->m(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    sget-object v0, Ll/c7;->y:Ljava/lang/Class;

    .line 9
    .line 10
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iget-object v2, p0, Ll/c7;->j:Ljava/lang/String;

    .line 19
    .line 20
    const-string v3, "controller %x %s: onClick"

    .line 21
    .line 22
    invoke-static {v0, v3, v1, v2}, Ll/huf;->p(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    invoke-virtual {p0}, Ll/c7;->f0()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    iget-object v0, p0, Ll/c7;->d:Ll/i6d0;

    .line 32
    .line 33
    invoke-virtual {v0}, Ll/i6d0;->b()V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/c7;->h:Ll/dve0;

    .line 37
    .line 38
    invoke-interface {v0}, Ll/dve0;->reset()V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Ll/c7;->g0()V

    .line 42
    .line 43
    .line 44
    const/4 p0, 0x1

    .line 45
    return p0

    .line 46
    :cond_1
    const/4 p0, 0x0

    .line 47
    return p0
.end method

.method public a0(Ll/x36;)V
    .locals 0

    .line 1
    return-void
.end method

.method public b(Landroid/view/MotionEvent;)Z
    .locals 4

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-static {v0}, Ll/huf;->m(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    sget-object v0, Ll/c7;->y:Ljava/lang/Class;

    .line 9
    .line 10
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iget-object v2, p0, Ll/c7;->j:Ljava/lang/String;

    .line 19
    .line 20
    const-string v3, "controller %x %s: onTouchEvent %s"

    .line 21
    .line 22
    invoke-static {v0, v3, v1, v2, p1}, Ll/huf;->q(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    iget-object v0, p0, Ll/c7;->e:Ll/jmj;

    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    if-nez v0, :cond_1

    .line 29
    .line 30
    return v1

    .line 31
    :cond_1
    invoke-virtual {v0}, Ll/jmj;->b()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_3

    .line 36
    .line 37
    invoke-virtual {p0}, Ll/c7;->e0()Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_2

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_2
    return v1

    .line 45
    :cond_3
    :goto_0
    iget-object p0, p0, Ll/c7;->e:Ll/jmj;

    .line 46
    .line 47
    invoke-virtual {p0, p1}, Ll/jmj;->d(Landroid/view/MotionEvent;)Z

    .line 48
    .line 49
    .line 50
    const/4 p0, 0x1

    .line 51
    return p0
.end method

.method public b0(Ll/jmj;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/c7;->e:Ll/jmj;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Ll/jmj;->f(Ll/jmj$a;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public c(Ll/mde;)V
    .locals 4

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-static {v0}, Ll/huf;->m(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    sget-object v0, Ll/c7;->y:Ljava/lang/Class;

    .line 9
    .line 10
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iget-object v2, p0, Ll/c7;->j:Ljava/lang/String;

    .line 19
    .line 20
    const-string v3, "controller %x %s: setHierarchy: %s"

    .line 21
    .line 22
    invoke-static {v0, v3, v1, v2, p1}, Ll/huf;->q(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    iget-object v0, p0, Ll/c7;->a:Lcom/facebook/drawee/components/DraweeEventTracker;

    .line 26
    .line 27
    if-eqz p1, :cond_1

    .line 28
    .line 29
    sget-object v1, Lcom/facebook/drawee/components/DraweeEventTracker$Event;->ON_SET_HIERARCHY:Lcom/facebook/drawee/components/DraweeEventTracker$Event;

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    sget-object v1, Lcom/facebook/drawee/components/DraweeEventTracker$Event;->ON_CLEAR_HIERARCHY:Lcom/facebook/drawee/components/DraweeEventTracker$Event;

    .line 33
    .line 34
    :goto_0
    invoke-virtual {v0, v1}, Lcom/facebook/drawee/components/DraweeEventTracker;->b(Lcom/facebook/drawee/components/DraweeEventTracker$Event;)V

    .line 35
    .line 36
    .line 37
    iget-boolean v0, p0, Ll/c7;->m:Z

    .line 38
    .line 39
    if-eqz v0, :cond_2

    .line 40
    .line 41
    iget-object v0, p0, Ll/c7;->b:Ll/ytd;

    .line 42
    .line 43
    invoke-virtual {v0, p0}, Ll/ytd;->a(Ll/ytd$a;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Ll/c7;->release()V

    .line 47
    .line 48
    .line 49
    :cond_2
    iget-object v0, p0, Ll/c7;->h:Ll/dve0;

    .line 50
    .line 51
    if-eqz v0, :cond_3

    .line 52
    .line 53
    const/4 v1, 0x0

    .line 54
    invoke-interface {v0, v1}, Ll/dve0;->c(Landroid/graphics/drawable/Drawable;)V

    .line 55
    .line 56
    .line 57
    iput-object v1, p0, Ll/c7;->h:Ll/dve0;

    .line 58
    .line 59
    :cond_3
    if-eqz p1, :cond_4

    .line 60
    .line 61
    instance-of v0, p1, Ll/dve0;

    .line 62
    .line 63
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-static {v0}, Ll/wn80;->b(Ljava/lang/Boolean;)V

    .line 68
    .line 69
    .line 70
    check-cast p1, Ll/dve0;

    .line 71
    .line 72
    iput-object p1, p0, Ll/c7;->h:Ll/dve0;

    .line 73
    .line 74
    iget-object p0, p0, Ll/c7;->i:Landroid/graphics/drawable/Drawable;

    .line 75
    .line 76
    invoke-interface {p1, p0}, Ll/dve0;->c(Landroid/graphics/drawable/Drawable;)V

    .line 77
    .line 78
    .line 79
    :cond_4
    return-void
.end method

.method public c0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/c7;->u:Z

    .line 2
    .line 3
    return-void
.end method

.method public d()V
    .locals 5

    .line 1
    invoke-static {}, Ll/i9j;->d()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "AbstractDraweeController#onAttach"

    .line 8
    .line 9
    invoke-static {v0}, Ll/i9j;->a(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    const/4 v0, 0x2

    .line 13
    invoke-static {v0}, Ll/huf;->m(I)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_2

    .line 18
    .line 19
    sget-object v0, Ll/c7;->y:Ljava/lang/Class;

    .line 20
    .line 21
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    iget-object v2, p0, Ll/c7;->j:Ljava/lang/String;

    .line 30
    .line 31
    iget-boolean v3, p0, Ll/c7;->m:Z

    .line 32
    .line 33
    if-eqz v3, :cond_1

    .line 34
    .line 35
    const-string v3, "request already submitted"

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    const-string v3, "request needs submit"

    .line 39
    .line 40
    :goto_0
    const-string v4, "controller %x %s: onAttach: %s"

    .line 41
    .line 42
    invoke-static {v0, v4, v1, v2, v3}, Ll/huf;->q(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    :cond_2
    iget-object v0, p0, Ll/c7;->a:Lcom/facebook/drawee/components/DraweeEventTracker;

    .line 46
    .line 47
    sget-object v1, Lcom/facebook/drawee/components/DraweeEventTracker$Event;->ON_ATTACH_CONTROLLER:Lcom/facebook/drawee/components/DraweeEventTracker$Event;

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Lcom/facebook/drawee/components/DraweeEventTracker;->b(Lcom/facebook/drawee/components/DraweeEventTracker$Event;)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Ll/c7;->h:Ll/dve0;

    .line 53
    .line 54
    invoke-static {v0}, Ll/wn80;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Ll/c7;->b:Ll/ytd;

    .line 58
    .line 59
    invoke-virtual {v0, p0}, Ll/ytd;->a(Ll/ytd$a;)V

    .line 60
    .line 61
    .line 62
    const/4 v0, 0x1

    .line 63
    iput-boolean v0, p0, Ll/c7;->l:Z

    .line 64
    .line 65
    iget-boolean v0, p0, Ll/c7;->m:Z

    .line 66
    .line 67
    if-nez v0, :cond_3

    .line 68
    .line 69
    invoke-virtual {p0}, Ll/c7;->g0()V

    .line 70
    .line 71
    .line 72
    :cond_3
    invoke-static {}, Ll/i9j;->d()Z

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    if-eqz p0, :cond_4

    .line 77
    .line 78
    invoke-static {}, Ll/i9j;->b()V

    .line 79
    .line 80
    .line 81
    :cond_4
    return-void
.end method

.method public d0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/c7;->p:Z

    .line 2
    .line 3
    return-void
.end method

.method public e()V
    .locals 4

    .line 1
    invoke-static {}, Ll/i9j;->d()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "AbstractDraweeController#onDetach"

    .line 8
    .line 9
    invoke-static {v0}, Ll/i9j;->a(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    const/4 v0, 0x2

    .line 13
    invoke-static {v0}, Ll/huf;->m(I)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    sget-object v0, Ll/c7;->y:Ljava/lang/Class;

    .line 20
    .line 21
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    iget-object v2, p0, Ll/c7;->j:Ljava/lang/String;

    .line 30
    .line 31
    const-string v3, "controller %x %s: onDetach"

    .line 32
    .line 33
    invoke-static {v0, v3, v1, v2}, Ll/huf;->p(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    :cond_1
    iget-object v0, p0, Ll/c7;->a:Lcom/facebook/drawee/components/DraweeEventTracker;

    .line 37
    .line 38
    sget-object v1, Lcom/facebook/drawee/components/DraweeEventTracker$Event;->ON_DETACH_CONTROLLER:Lcom/facebook/drawee/components/DraweeEventTracker$Event;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Lcom/facebook/drawee/components/DraweeEventTracker;->b(Lcom/facebook/drawee/components/DraweeEventTracker$Event;)V

    .line 41
    .line 42
    .line 43
    const/4 v0, 0x0

    .line 44
    iput-boolean v0, p0, Ll/c7;->l:Z

    .line 45
    .line 46
    iget-object v0, p0, Ll/c7;->b:Ll/ytd;

    .line 47
    .line 48
    invoke-virtual {v0, p0}, Ll/ytd;->d(Ll/ytd$a;)V

    .line 49
    .line 50
    .line 51
    invoke-static {}, Ll/i9j;->d()Z

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    if-eqz p0, :cond_2

    .line 56
    .line 57
    invoke-static {}, Ll/i9j;->b()V

    .line 58
    .line 59
    .line 60
    :cond_2
    return-void
.end method

.method public e0()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/c7;->f0()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public f()Landroid/graphics/drawable/Animatable;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/c7;->v:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    instance-of v0, p0, Landroid/graphics/drawable/Animatable;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p0, Landroid/graphics/drawable/Animatable;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public final f0()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/c7;->o:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/c7;->d:Ll/i6d0;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/i6d0;->e()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public g0()V
    .locals 9

    .line 1
    invoke-static {}, Ll/i9j;->d()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "AbstractDraweeController#submitRequest"

    .line 8
    .line 9
    invoke-static {v0}, Ll/i9j;->a(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    invoke-virtual {p0}, Ll/c7;->m()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v4

    .line 16
    const/4 v0, 0x0

    .line 17
    const/4 v1, 0x0

    .line 18
    const/4 v2, 0x1

    .line 19
    if-eqz v4, :cond_3

    .line 20
    .line 21
    invoke-static {}, Ll/i9j;->d()Z

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    if-eqz v3, :cond_1

    .line 26
    .line 27
    const-string v3, "AbstractDraweeController#submitRequest->cache"

    .line 28
    .line 29
    invoke-static {v3}, Ll/i9j;->a(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    :cond_1
    iput-object v1, p0, Ll/c7;->r:Ll/i6c;

    .line 33
    .line 34
    iput-boolean v2, p0, Ll/c7;->m:Z

    .line 35
    .line 36
    iput-boolean v0, p0, Ll/c7;->o:Z

    .line 37
    .line 38
    iget-object v0, p0, Ll/c7;->a:Lcom/facebook/drawee/components/DraweeEventTracker;

    .line 39
    .line 40
    sget-object v1, Lcom/facebook/drawee/components/DraweeEventTracker$Event;->ON_SUBMIT_CACHE_HIT:Lcom/facebook/drawee/components/DraweeEventTracker$Event;

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Lcom/facebook/drawee/components/DraweeEventTracker;->b(Lcom/facebook/drawee/components/DraweeEventTracker$Event;)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Ll/c7;->r:Ll/i6c;

    .line 46
    .line 47
    invoke-virtual {p0, v4}, Ll/c7;->x(Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {p0, v0, v1}, Ll/c7;->W(Ll/i6c;Ljava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Ll/c7;->j:Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {p0, v0, v4}, Ll/c7;->L(Ljava/lang/String;Ljava/lang/Object;)V

    .line 57
    .line 58
    .line 59
    iget-object v2, p0, Ll/c7;->j:Ljava/lang/String;

    .line 60
    .line 61
    iget-object v3, p0, Ll/c7;->r:Ll/i6c;

    .line 62
    .line 63
    const/4 v7, 0x1

    .line 64
    const/4 v8, 0x1

    .line 65
    const/high16 v5, 0x3f800000    # 1.0f

    .line 66
    .line 67
    const/4 v6, 0x1

    .line 68
    move-object v1, p0

    .line 69
    invoke-virtual/range {v1 .. v8}, Ll/c7;->M(Ljava/lang/String;Ll/i6c;Ljava/lang/Object;FZZZ)V

    .line 70
    .line 71
    .line 72
    invoke-static {}, Ll/i9j;->d()Z

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    if-eqz p0, :cond_2

    .line 77
    .line 78
    invoke-static {}, Ll/i9j;->b()V

    .line 79
    .line 80
    .line 81
    :cond_2
    invoke-static {}, Ll/i9j;->d()Z

    .line 82
    .line 83
    .line 84
    move-result p0

    .line 85
    if-eqz p0, :cond_5

    .line 86
    .line 87
    invoke-static {}, Ll/i9j;->b()V

    .line 88
    .line 89
    .line 90
    return-void

    .line 91
    :cond_3
    iget-object v3, p0, Ll/c7;->a:Lcom/facebook/drawee/components/DraweeEventTracker;

    .line 92
    .line 93
    sget-object v4, Lcom/facebook/drawee/components/DraweeEventTracker$Event;->ON_DATASOURCE_SUBMIT:Lcom/facebook/drawee/components/DraweeEventTracker$Event;

    .line 94
    .line 95
    invoke-virtual {v3, v4}, Lcom/facebook/drawee/components/DraweeEventTracker;->b(Lcom/facebook/drawee/components/DraweeEventTracker$Event;)V

    .line 96
    .line 97
    .line 98
    iget-object v3, p0, Ll/c7;->h:Ll/dve0;

    .line 99
    .line 100
    const/4 v4, 0x0

    .line 101
    invoke-interface {v3, v4, v2}, Ll/dve0;->e(FZ)V

    .line 102
    .line 103
    .line 104
    iput-boolean v2, p0, Ll/c7;->m:Z

    .line 105
    .line 106
    iput-boolean v0, p0, Ll/c7;->o:Z

    .line 107
    .line 108
    invoke-virtual {p0}, Ll/c7;->r()Ll/i6c;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    iput-object v0, p0, Ll/c7;->r:Ll/i6c;

    .line 113
    .line 114
    invoke-virtual {p0, v0, v1}, Ll/c7;->W(Ll/i6c;Ljava/lang/Object;)V

    .line 115
    .line 116
    .line 117
    const/4 v0, 0x2

    .line 118
    invoke-static {v0}, Ll/huf;->m(I)Z

    .line 119
    .line 120
    .line 121
    move-result v0

    .line 122
    if-eqz v0, :cond_4

    .line 123
    .line 124
    sget-object v0, Ll/c7;->y:Ljava/lang/Class;

    .line 125
    .line 126
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 127
    .line 128
    .line 129
    move-result v1

    .line 130
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    iget-object v2, p0, Ll/c7;->j:Ljava/lang/String;

    .line 135
    .line 136
    iget-object v3, p0, Ll/c7;->r:Ll/i6c;

    .line 137
    .line 138
    invoke-static {v3}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 139
    .line 140
    .line 141
    move-result v3

    .line 142
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 143
    .line 144
    .line 145
    move-result-object v3

    .line 146
    const-string v4, "controller %x %s: submitRequest: dataSource: %x"

    .line 147
    .line 148
    invoke-static {v0, v4, v1, v2, v3}, Ll/huf;->q(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 149
    .line 150
    .line 151
    :cond_4
    iget-object v0, p0, Ll/c7;->j:Ljava/lang/String;

    .line 152
    .line 153
    iget-object v1, p0, Ll/c7;->r:Ll/i6c;

    .line 154
    .line 155
    invoke-interface {v1}, Ll/i6c;->a()Z

    .line 156
    .line 157
    .line 158
    move-result v1

    .line 159
    new-instance v2, Ll/c7$a;

    .line 160
    .line 161
    invoke-direct {v2, p0, v0, v1}, Ll/c7$a;-><init>(Ll/c7;Ljava/lang/String;Z)V

    .line 162
    .line 163
    .line 164
    iget-object v0, p0, Ll/c7;->r:Ll/i6c;

    .line 165
    .line 166
    iget-object p0, p0, Ll/c7;->c:Ljava/util/concurrent/Executor;

    .line 167
    .line 168
    invoke-interface {v0, v2, p0}, Ll/i6c;->f(Ll/s6c;Ljava/util/concurrent/Executor;)V

    .line 169
    .line 170
    .line 171
    invoke-static {}, Ll/i9j;->d()Z

    .line 172
    .line 173
    .line 174
    move-result p0

    .line 175
    if-eqz p0, :cond_5

    .line 176
    .line 177
    invoke-static {}, Ll/i9j;->b()V

    .line 178
    .line 179
    .line 180
    :cond_5
    return-void
.end method

.method public getHierarchy()Ll/mde;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c7;->h:Ll/dve0;

    .line 2
    .line 3
    return-object p0
.end method

.method public j(Ll/v36;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/v36<",
            "-TINFO;>;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/wn80;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/c7;->f:Ll/v36;

    .line 5
    .line 6
    instance-of v1, v0, Ll/c7$b;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    check-cast v0, Ll/c7$b;

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Ll/o2j;->g(Ll/v36;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    if-eqz v0, :cond_1

    .line 17
    .line 18
    invoke-static {v0, p1}, Ll/c7$b;->j(Ll/v36;Ll/v36;)Ll/c7$b;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iput-object p1, p0, Ll/c7;->f:Ll/v36;

    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    iput-object p1, p0, Ll/c7;->f:Ll/v36;

    .line 26
    .line 27
    return-void
.end method

.method public k(Ll/u36;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/u36<",
            "TINFO;>;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/c7;->g:Ll/n2j;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/n2j;->k(Ll/u36;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public abstract l(Ljava/lang/Object;)Landroid/graphics/drawable/Drawable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Landroid/graphics/drawable/Drawable;"
        }
    .end annotation
.end method

.method public m()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public n()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c7;->k:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public o()Ll/v36;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v36<",
            "TINFO;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/c7;->f:Ll/v36;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/li2;->g()Ll/v36;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public p()Ll/u36;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/u36<",
            "TINFO;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/c7;->g:Ll/n2j;

    .line 2
    .line 3
    return-object p0
.end method

.method public q()Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c7;->i:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    return-object p0
.end method

.method public abstract r()Ll/i6c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/i6c<",
            "TT;>;"
        }
    .end annotation
.end method

.method public release()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/c7;->a:Lcom/facebook/drawee/components/DraweeEventTracker;

    .line 2
    .line 3
    sget-object v1, Lcom/facebook/drawee/components/DraweeEventTracker$Event;->ON_RELEASE_CONTROLLER:Lcom/facebook/drawee/components/DraweeEventTracker$Event;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/facebook/drawee/components/DraweeEventTracker;->b(Lcom/facebook/drawee/components/DraweeEventTracker$Event;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/c7;->d:Ll/i6d0;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/i6d0;->c()V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, Ll/c7;->e:Ll/jmj;

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/jmj;->e()V

    .line 20
    .line 21
    .line 22
    :cond_1
    iget-object v0, p0, Ll/c7;->h:Ll/dve0;

    .line 23
    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    invoke-interface {v0}, Ll/dve0;->reset()V

    .line 27
    .line 28
    .line 29
    :cond_2
    invoke-virtual {p0}, Ll/c7;->P()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final s()Landroid/graphics/Rect;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c7;->h:Ll/dve0;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    invoke-interface {p0}, Ll/mde;->getBounds()Landroid/graphics/Rect;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public t()Ll/jmj;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c7;->e:Ll/jmj;

    .line 2
    .line 3
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    invoke-static {p0}, Ll/i950;->b(Ljava/lang/Object;)Ll/i950$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "isAttached"

    .line 6
    .line 7
    iget-boolean v2, p0, Ll/c7;->l:Z

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2}, Ll/i950$a;->c(Ljava/lang/String;Z)Ll/i950$a;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "isRequestSubmitted"

    .line 14
    .line 15
    iget-boolean v2, p0, Ll/c7;->m:Z

    .line 16
    .line 17
    invoke-virtual {v0, v1, v2}, Ll/i950$a;->c(Ljava/lang/String;Z)Ll/i950$a;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "hasFetchFailed"

    .line 22
    .line 23
    iget-boolean v2, p0, Ll/c7;->o:Z

    .line 24
    .line 25
    invoke-virtual {v0, v1, v2}, Ll/i950$a;->c(Ljava/lang/String;Z)Ll/i950$a;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object v1, p0, Ll/c7;->s:Ljava/lang/Object;

    .line 30
    .line 31
    invoke-virtual {p0, v1}, Ll/c7;->w(Ljava/lang/Object;)I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    const-string v2, "fetchedImage"

    .line 36
    .line 37
    invoke-virtual {v0, v2, v1}, Ll/i950$a;->a(Ljava/lang/String;I)Ll/i950$a;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iget-object p0, p0, Ll/c7;->a:Lcom/facebook/drawee/components/DraweeEventTracker;

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/facebook/drawee/components/DraweeEventTracker;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    const-string v1, "events"

    .line 48
    .line 49
    invoke-virtual {v0, v1, p0}, Ll/i950$a;->b(Ljava/lang/String;Ljava/lang/Object;)Ll/i950$a;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p0}, Ll/i950$a;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    return-object p0
.end method

.method public u()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c7;->j:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public v(Ljava/lang/Object;)Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    const-string p0, "<null>"

    .line 13
    .line 14
    return-object p0
.end method

.method public w(Ljava/lang/Object;)I
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)I"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public abstract x(Ljava/lang/Object;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)TINFO;"
        }
    .end annotation
.end method

.method public y()Landroid/net/Uri;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public z()Ll/i6d0;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/c7;->d:Ll/i6d0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/i6d0;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/i6d0;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/c7;->d:Ll/i6d0;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Ll/c7;->d:Ll/i6d0;

    .line 13
    .line 14
    return-object p0
.end method
