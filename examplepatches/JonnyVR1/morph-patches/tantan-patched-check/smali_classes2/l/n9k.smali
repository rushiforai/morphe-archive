.class public Ll/n9k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/h2e0;
.implements Ll/sl50;
.implements Ll/v6f;


# annotations
.annotation build Landroidx/annotation/RestrictTo;
    value = {
        .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroidx/annotation/RestrictTo$Scope;
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/n9k$b;
    }
.end annotation


# static fields
.field public static final o:Ljava/lang/String;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ll/piq0;",
            "Lkotlinx/coroutines/o;",
            ">;"
        }
    .end annotation
.end field

.field public c:Ll/oud;

.field public d:Z

.field public final e:Ljava/lang/Object;

.field public final f:Ll/f3g0;

.field public final g:Landroidx/work/impl/a;

.field public final h:Ll/siq0;

.field public final i:Landroidx/work/a;

.field public final j:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ll/piq0;",
            "Ll/n9k$b;",
            ">;"
        }
    .end annotation
.end field

.field public k:Ljava/lang/Boolean;

.field public final l:Landroidx/work/impl/constraints/WorkConstraintsTracker;

.field public final m:Ll/zni0;

.field public final n:Ll/szi0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "GreedyScheduler"

    .line 2
    .line 3
    invoke-static {v0}, Ll/qzv;->i(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Ll/n9k;->o:Ljava/lang/String;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroidx/work/a;Ll/fgj0;Landroidx/work/impl/a;Ll/siq0;Ll/zni0;)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroidx/work/a;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ll/fgj0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Landroidx/work/impl/a;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p5    # Ll/siq0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p6    # Ll/zni0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/n9k;->b:Ljava/util/Map;

    .line 10
    .line 11
    new-instance v0, Ljava/lang/Object;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/n9k;->e:Ljava/lang/Object;

    .line 17
    .line 18
    invoke-static {}, Ll/f3g0;->create()Ll/f3g0;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iput-object v0, p0, Ll/n9k;->f:Ll/f3g0;

    .line 23
    .line 24
    new-instance v0, Ljava/util/HashMap;

    .line 25
    .line 26
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 27
    .line 28
    .line 29
    iput-object v0, p0, Ll/n9k;->j:Ljava/util/Map;

    .line 30
    .line 31
    iput-object p1, p0, Ll/n9k;->a:Landroid/content/Context;

    .line 32
    .line 33
    invoke-virtual {p2}, Landroidx/work/a;->k()Ll/vqd0;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    new-instance v0, Ll/oud;

    .line 38
    .line 39
    invoke-virtual {p2}, Landroidx/work/a;->a()Ll/sa5;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-direct {v0, p0, p1, v1}, Ll/oud;-><init>(Ll/h2e0;Ll/vqd0;Ll/sa5;)V

    .line 44
    .line 45
    .line 46
    iput-object v0, p0, Ll/n9k;->c:Ll/oud;

    .line 47
    .line 48
    new-instance v0, Ll/szi0;

    .line 49
    .line 50
    invoke-direct {v0, p1, p5}, Ll/szi0;-><init>(Ll/vqd0;Ll/siq0;)V

    .line 51
    .line 52
    .line 53
    iput-object v0, p0, Ll/n9k;->n:Ll/szi0;

    .line 54
    .line 55
    iput-object p6, p0, Ll/n9k;->m:Ll/zni0;

    .line 56
    .line 57
    new-instance p1, Landroidx/work/impl/constraints/WorkConstraintsTracker;

    .line 58
    .line 59
    invoke-direct {p1, p3}, Landroidx/work/impl/constraints/WorkConstraintsTracker;-><init>(Ll/fgj0;)V

    .line 60
    .line 61
    .line 62
    iput-object p1, p0, Ll/n9k;->l:Landroidx/work/impl/constraints/WorkConstraintsTracker;

    .line 63
    .line 64
    iput-object p2, p0, Ll/n9k;->i:Landroidx/work/a;

    .line 65
    .line 66
    iput-object p4, p0, Ll/n9k;->g:Landroidx/work/impl/a;

    .line 67
    .line 68
    iput-object p5, p0, Ll/n9k;->h:Ll/siq0;

    .line 69
    .line 70
    return-void
.end method


# virtual methods
.method public a(Ll/mjq0;Landroidx/work/impl/constraints/a;)V
    .locals 4
    .param p1    # Ll/mjq0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroidx/work/impl/constraints/a;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-static {p1}, Ll/tjq0;->a(Ll/mjq0;)Ll/piq0;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    instance-of v0, p2, Landroidx/work/impl/constraints/a$a;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p2, p0, Ll/n9k;->f:Ll/f3g0;

    .line 10
    .line 11
    invoke-interface {p2, p1}, Ll/f3g0;->d(Ll/piq0;)Z

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    if-nez p2, :cond_1

    .line 16
    .line 17
    invoke-static {}, Ll/qzv;->e()Ll/qzv;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    sget-object v0, Ll/n9k;->o:Ljava/lang/String;

    .line 22
    .line 23
    new-instance v1, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    const-string v2, "Constraints met: Scheduling work ID "

    .line 26
    .line 27
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {p2, v0, v1}, Ll/qzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iget-object p2, p0, Ll/n9k;->f:Ll/f3g0;

    .line 41
    .line 42
    invoke-interface {p2, p1}, Ll/f3g0;->a(Ll/piq0;)Ll/e3g0;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    iget-object p2, p0, Ll/n9k;->n:Ll/szi0;

    .line 47
    .line 48
    invoke-virtual {p2, p1}, Ll/szi0;->c(Ll/e3g0;)V

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Ll/n9k;->h:Ll/siq0;

    .line 52
    .line 53
    invoke-interface {p0, p1}, Ll/siq0;->c(Ll/e3g0;)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_0
    invoke-static {}, Ll/qzv;->e()Ll/qzv;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    sget-object v1, Ll/n9k;->o:Ljava/lang/String;

    .line 62
    .line 63
    new-instance v2, Ljava/lang/StringBuilder;

    .line 64
    .line 65
    const-string v3, "Constraints not met: Cancelling work ID "

    .line 66
    .line 67
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    invoke-virtual {v0, v1, v2}, Ll/qzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, Ll/n9k;->f:Ll/f3g0;

    .line 81
    .line 82
    invoke-interface {v0, p1}, Ll/f3g0;->e(Ll/piq0;)Ll/e3g0;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    if-eqz p1, :cond_1

    .line 87
    .line 88
    iget-object v0, p0, Ll/n9k;->n:Ll/szi0;

    .line 89
    .line 90
    invoke-virtual {v0, p1}, Ll/szi0;->b(Ll/e3g0;)V

    .line 91
    .line 92
    .line 93
    check-cast p2, Landroidx/work/impl/constraints/a$b;

    .line 94
    .line 95
    invoke-virtual {p2}, Landroidx/work/impl/constraints/a$b;->a()I

    .line 96
    .line 97
    .line 98
    move-result p2

    .line 99
    iget-object p0, p0, Ll/n9k;->h:Ll/siq0;

    .line 100
    .line 101
    invoke-interface {p0, p1, p2}, Ll/siq0;->a(Ll/e3g0;I)V

    .line 102
    .line 103
    .line 104
    :cond_1
    return-void
.end method

.method public b()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public c(Ljava/lang/String;)V
    .locals 4
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/n9k;->k:Ljava/lang/Boolean;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/n9k;->e()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Ll/n9k;->k:Ljava/lang/Boolean;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    invoke-static {}, Ll/qzv;->e()Ll/qzv;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    sget-object p1, Ll/n9k;->o:Ljava/lang/String;

    .line 21
    .line 22
    const-string v0, "Ignoring schedule request in non-main process"

    .line 23
    .line 24
    invoke-virtual {p0, p1, v0}, Ll/qzv;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_1
    invoke-virtual {p0}, Ll/n9k;->f()V

    .line 29
    .line 30
    .line 31
    invoke-static {}, Ll/qzv;->e()Ll/qzv;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    sget-object v1, Ll/n9k;->o:Ljava/lang/String;

    .line 36
    .line 37
    new-instance v2, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    const-string v3, "Cancelling work ID "

    .line 40
    .line 41
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-virtual {v0, v1, v2}, Ll/qzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Ll/n9k;->c:Ll/oud;

    .line 55
    .line 56
    if-eqz v0, :cond_2

    .line 57
    .line 58
    invoke-virtual {v0, p1}, Ll/oud;->b(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    :cond_2
    iget-object v0, p0, Ll/n9k;->f:Ll/f3g0;

    .line 62
    .line 63
    invoke-interface {v0, p1}, Ll/f3g0;->remove(Ljava/lang/String;)Ljava/util/List;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-eqz v0, :cond_3

    .line 76
    .line 77
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    check-cast v0, Ll/e3g0;

    .line 82
    .line 83
    iget-object v1, p0, Ll/n9k;->n:Ll/szi0;

    .line 84
    .line 85
    invoke-virtual {v1, v0}, Ll/szi0;->b(Ll/e3g0;)V

    .line 86
    .line 87
    .line 88
    iget-object v1, p0, Ll/n9k;->h:Ll/siq0;

    .line 89
    .line 90
    invoke-interface {v1, v0}, Ll/siq0;->b(Ll/e3g0;)V

    .line 91
    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_3
    return-void
.end method

.method public varargs d([Ll/mjq0;)V
    .locals 11
    .param p1    # [Ll/mjq0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/n9k;->k:Ljava/lang/Boolean;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/n9k;->e()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Ll/n9k;->k:Ljava/lang/Boolean;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    invoke-static {}, Ll/qzv;->e()Ll/qzv;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    sget-object p1, Ll/n9k;->o:Ljava/lang/String;

    .line 21
    .line 22
    const-string v0, "Ignoring schedule request in a secondary process"

    .line 23
    .line 24
    invoke-virtual {p0, p1, v0}, Ll/qzv;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_1
    invoke-virtual {p0}, Ll/n9k;->f()V

    .line 29
    .line 30
    .line 31
    new-instance v0, Ljava/util/HashSet;

    .line 32
    .line 33
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 34
    .line 35
    .line 36
    new-instance v1, Ljava/util/HashSet;

    .line 37
    .line 38
    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 39
    .line 40
    .line 41
    array-length v2, p1

    .line 42
    const/4 v3, 0x0

    .line 43
    :goto_0
    if-ge v3, v2, :cond_8

    .line 44
    .line 45
    aget-object v4, p1, v3

    .line 46
    .line 47
    invoke-static {v4}, Ll/tjq0;->a(Ll/mjq0;)Ll/piq0;

    .line 48
    .line 49
    .line 50
    move-result-object v5

    .line 51
    iget-object v6, p0, Ll/n9k;->f:Ll/f3g0;

    .line 52
    .line 53
    invoke-interface {v6, v5}, Ll/f3g0;->d(Ll/piq0;)Z

    .line 54
    .line 55
    .line 56
    move-result v5

    .line 57
    if-eqz v5, :cond_2

    .line 58
    .line 59
    goto/16 :goto_1

    .line 60
    .line 61
    :cond_2
    invoke-virtual {p0, v4}, Ll/n9k;->h(Ll/mjq0;)J

    .line 62
    .line 63
    .line 64
    move-result-wide v5

    .line 65
    invoke-virtual {v4}, Ll/mjq0;->b()J

    .line 66
    .line 67
    .line 68
    move-result-wide v7

    .line 69
    invoke-static {v7, v8, v5, v6}, Ljava/lang/Math;->max(JJ)J

    .line 70
    .line 71
    .line 72
    move-result-wide v5

    .line 73
    iget-object v7, p0, Ll/n9k;->i:Landroidx/work/a;

    .line 74
    .line 75
    invoke-virtual {v7}, Landroidx/work/a;->a()Ll/sa5;

    .line 76
    .line 77
    .line 78
    move-result-object v7

    .line 79
    invoke-interface {v7}, Ll/sa5;->currentTimeMillis()J

    .line 80
    .line 81
    .line 82
    move-result-wide v7

    .line 83
    iget-object v9, v4, Ll/mjq0;->b:Landroidx/work/WorkInfo$State;

    .line 84
    .line 85
    sget-object v10, Landroidx/work/WorkInfo$State;->ENQUEUED:Landroidx/work/WorkInfo$State;

    .line 86
    .line 87
    if-ne v9, v10, :cond_7

    .line 88
    .line 89
    cmp-long v7, v7, v5

    .line 90
    .line 91
    if-gez v7, :cond_3

    .line 92
    .line 93
    iget-object v7, p0, Ll/n9k;->c:Ll/oud;

    .line 94
    .line 95
    if-eqz v7, :cond_7

    .line 96
    .line 97
    invoke-virtual {v7, v4, v5, v6}, Ll/oud;->a(Ll/mjq0;J)V

    .line 98
    .line 99
    .line 100
    goto/16 :goto_1

    .line 101
    .line 102
    :cond_3
    invoke-virtual {v4}, Ll/mjq0;->k()Z

    .line 103
    .line 104
    .line 105
    move-result v5

    .line 106
    if-eqz v5, :cond_6

    .line 107
    .line 108
    iget-object v5, v4, Ll/mjq0;->j:Ll/l06;

    .line 109
    .line 110
    invoke-virtual {v5}, Ll/l06;->j()Z

    .line 111
    .line 112
    .line 113
    move-result v6

    .line 114
    if-eqz v6, :cond_4

    .line 115
    .line 116
    invoke-static {}, Ll/qzv;->e()Ll/qzv;

    .line 117
    .line 118
    .line 119
    move-result-object v5

    .line 120
    sget-object v6, Ll/n9k;->o:Ljava/lang/String;

    .line 121
    .line 122
    new-instance v7, Ljava/lang/StringBuilder;

    .line 123
    .line 124
    const-string v8, "Ignoring "

    .line 125
    .line 126
    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    const-string v4, ". Requires device idle."

    .line 133
    .line 134
    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object v4

    .line 141
    invoke-virtual {v5, v6, v4}, Ll/qzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 142
    .line 143
    .line 144
    goto :goto_1

    .line 145
    :cond_4
    invoke-virtual {v5}, Ll/l06;->g()Z

    .line 146
    .line 147
    .line 148
    move-result v5

    .line 149
    if-eqz v5, :cond_5

    .line 150
    .line 151
    invoke-static {}, Ll/qzv;->e()Ll/qzv;

    .line 152
    .line 153
    .line 154
    move-result-object v5

    .line 155
    sget-object v6, Ll/n9k;->o:Ljava/lang/String;

    .line 156
    .line 157
    new-instance v7, Ljava/lang/StringBuilder;

    .line 158
    .line 159
    const-string v8, "Ignoring "

    .line 160
    .line 161
    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 165
    .line 166
    .line 167
    const-string v4, ". Requires ContentUri triggers."

    .line 168
    .line 169
    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object v4

    .line 176
    invoke-virtual {v5, v6, v4}, Ll/qzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 177
    .line 178
    .line 179
    goto :goto_1

    .line 180
    :cond_5
    invoke-interface {v0, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 181
    .line 182
    .line 183
    iget-object v4, v4, Ll/mjq0;->a:Ljava/lang/String;

    .line 184
    .line 185
    invoke-interface {v1, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 186
    .line 187
    .line 188
    goto :goto_1

    .line 189
    :cond_6
    iget-object v5, p0, Ll/n9k;->f:Ll/f3g0;

    .line 190
    .line 191
    invoke-static {v4}, Ll/tjq0;->a(Ll/mjq0;)Ll/piq0;

    .line 192
    .line 193
    .line 194
    move-result-object v6

    .line 195
    invoke-interface {v5, v6}, Ll/f3g0;->d(Ll/piq0;)Z

    .line 196
    .line 197
    .line 198
    move-result v5

    .line 199
    if-nez v5, :cond_7

    .line 200
    .line 201
    invoke-static {}, Ll/qzv;->e()Ll/qzv;

    .line 202
    .line 203
    .line 204
    move-result-object v5

    .line 205
    sget-object v6, Ll/n9k;->o:Ljava/lang/String;

    .line 206
    .line 207
    new-instance v7, Ljava/lang/StringBuilder;

    .line 208
    .line 209
    const-string v8, "Starting work for "

    .line 210
    .line 211
    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 212
    .line 213
    .line 214
    iget-object v8, v4, Ll/mjq0;->a:Ljava/lang/String;

    .line 215
    .line 216
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 217
    .line 218
    .line 219
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 220
    .line 221
    .line 222
    move-result-object v7

    .line 223
    invoke-virtual {v5, v6, v7}, Ll/qzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 224
    .line 225
    .line 226
    iget-object v5, p0, Ll/n9k;->f:Ll/f3g0;

    .line 227
    .line 228
    invoke-interface {v5, v4}, Ll/f3g0;->b(Ll/mjq0;)Ll/e3g0;

    .line 229
    .line 230
    .line 231
    move-result-object v4

    .line 232
    iget-object v5, p0, Ll/n9k;->n:Ll/szi0;

    .line 233
    .line 234
    invoke-virtual {v5, v4}, Ll/szi0;->c(Ll/e3g0;)V

    .line 235
    .line 236
    .line 237
    iget-object v5, p0, Ll/n9k;->h:Ll/siq0;

    .line 238
    .line 239
    invoke-interface {v5, v4}, Ll/siq0;->c(Ll/e3g0;)V

    .line 240
    .line 241
    .line 242
    :cond_7
    :goto_1
    add-int/lit8 v3, v3, 0x1

    .line 243
    .line 244
    goto/16 :goto_0

    .line 245
    .line 246
    :cond_8
    iget-object p1, p0, Ll/n9k;->e:Ljava/lang/Object;

    .line 247
    .line 248
    monitor-enter p1

    .line 249
    :try_start_0
    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    .line 250
    .line 251
    .line 252
    move-result v2

    .line 253
    if-nez v2, :cond_a

    .line 254
    .line 255
    const-string v2, ","

    .line 256
    .line 257
    invoke-static {v2, v1}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    .line 258
    .line 259
    .line 260
    move-result-object v1

    .line 261
    invoke-static {}, Ll/qzv;->e()Ll/qzv;

    .line 262
    .line 263
    .line 264
    move-result-object v2

    .line 265
    sget-object v3, Ll/n9k;->o:Ljava/lang/String;

    .line 266
    .line 267
    new-instance v4, Ljava/lang/StringBuilder;

    .line 268
    .line 269
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 270
    .line 271
    .line 272
    const-string v5, "Starting tracking for "

    .line 273
    .line 274
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 275
    .line 276
    .line 277
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 278
    .line 279
    .line 280
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 281
    .line 282
    .line 283
    move-result-object v1

    .line 284
    invoke-virtual {v2, v3, v1}, Ll/qzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 285
    .line 286
    .line 287
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 288
    .line 289
    .line 290
    move-result-object v0

    .line 291
    :cond_9
    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 292
    .line 293
    .line 294
    move-result v1

    .line 295
    if-eqz v1, :cond_a

    .line 296
    .line 297
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 298
    .line 299
    .line 300
    move-result-object v1

    .line 301
    check-cast v1, Ll/mjq0;

    .line 302
    .line 303
    invoke-static {v1}, Ll/tjq0;->a(Ll/mjq0;)Ll/piq0;

    .line 304
    .line 305
    .line 306
    move-result-object v2

    .line 307
    iget-object v3, p0, Ll/n9k;->b:Ljava/util/Map;

    .line 308
    .line 309
    invoke-interface {v3, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 310
    .line 311
    .line 312
    move-result v3

    .line 313
    if-nez v3, :cond_9

    .line 314
    .line 315
    iget-object v3, p0, Ll/n9k;->l:Landroidx/work/impl/constraints/WorkConstraintsTracker;

    .line 316
    .line 317
    iget-object v4, p0, Ll/n9k;->m:Ll/zni0;

    .line 318
    .line 319
    invoke-interface {v4}, Ll/zni0;->a()Lkotlinx/coroutines/CoroutineDispatcher;

    .line 320
    .line 321
    .line 322
    move-result-object v4

    .line 323
    invoke-static {v3, v1, v4, p0}, Landroidx/work/impl/constraints/WorkConstraintsTrackerKt;->c(Landroidx/work/impl/constraints/WorkConstraintsTracker;Ll/mjq0;Lkotlinx/coroutines/CoroutineDispatcher;Ll/sl50;)Lkotlinx/coroutines/o;

    .line 324
    .line 325
    .line 326
    move-result-object v1

    .line 327
    iget-object v3, p0, Ll/n9k;->b:Ljava/util/Map;

    .line 328
    .line 329
    invoke-interface {v3, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 330
    .line 331
    .line 332
    goto :goto_2

    .line 333
    :catchall_0
    move-exception p0

    .line 334
    goto :goto_3

    .line 335
    :cond_a
    monitor-exit p1

    .line 336
    return-void

    .line 337
    :goto_3
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 338
    throw p0
.end method

.method public final e()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/n9k;->a:Landroid/content/Context;

    .line 2
    .line 3
    iget-object v1, p0, Ll/n9k;->i:Landroidx/work/a;

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/rk90;->b(Landroid/content/Context;Landroidx/work/a;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Ll/n9k;->k:Ljava/lang/Boolean;

    .line 14
    .line 15
    return-void
.end method

.method public final f()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/n9k;->d:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/n9k;->g:Landroidx/work/impl/a;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Landroidx/work/impl/a;->e(Ll/v6f;)V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    iput-boolean v0, p0, Ll/n9k;->d:Z

    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public final g(Ll/piq0;)V
    .locals 4
    .param p1    # Ll/piq0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/n9k;->e:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Ll/n9k;->b:Ljava/util/Map;

    .line 5
    .line 6
    invoke-interface {p0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Lkotlinx/coroutines/o;

    .line 11
    .line 12
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Ll/qzv;->e()Ll/qzv;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sget-object v1, Ll/n9k;->o:Ljava/lang/String;

    .line 20
    .line 21
    new-instance v2, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    const-string v3, "Stopping tracking for "

    .line 24
    .line 25
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {v0, v1, p1}, Ll/qzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    const/4 p1, 0x0

    .line 39
    invoke-interface {p0, p1}, Lkotlinx/coroutines/o;->n(Ljava/util/concurrent/CancellationException;)V

    .line 40
    .line 41
    .line 42
    :cond_0
    return-void

    .line 43
    :catchall_0
    move-exception p0

    .line 44
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 45
    throw p0
.end method

.method public final h(Ll/mjq0;)J
    .locals 7

    .line 1
    iget-object v0, p0, Ll/n9k;->e:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    invoke-static {p1}, Ll/tjq0;->a(Ll/mjq0;)Ll/piq0;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    iget-object v2, p0, Ll/n9k;->j:Ljava/util/Map;

    .line 9
    .line 10
    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    check-cast v2, Ll/n9k$b;

    .line 15
    .line 16
    if-nez v2, :cond_0

    .line 17
    .line 18
    new-instance v2, Ll/n9k$b;

    .line 19
    .line 20
    iget v3, p1, Ll/mjq0;->k:I

    .line 21
    .line 22
    iget-object v4, p0, Ll/n9k;->i:Landroidx/work/a;

    .line 23
    .line 24
    invoke-virtual {v4}, Landroidx/work/a;->a()Ll/sa5;

    .line 25
    .line 26
    .line 27
    move-result-object v4

    .line 28
    invoke-interface {v4}, Ll/sa5;->currentTimeMillis()J

    .line 29
    .line 30
    .line 31
    move-result-wide v4

    .line 32
    const/4 v6, 0x0

    .line 33
    invoke-direct {v2, v3, v4, v5, v6}, Ll/n9k$b;-><init>(IJLl/n9k$a;)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Ll/n9k;->j:Ljava/util/Map;

    .line 37
    .line 38
    invoke-interface {p0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

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
    :cond_0
    :goto_0
    iget-wide v3, v2, Ll/n9k$b;->b:J

    .line 45
    .line 46
    iget p0, p1, Ll/mjq0;->k:I

    .line 47
    .line 48
    iget p1, v2, Ll/n9k$b;->a:I

    .line 49
    .line 50
    sub-int/2addr p0, p1

    .line 51
    add-int/lit8 p0, p0, -0x5

    .line 52
    .line 53
    const/4 p1, 0x0

    .line 54
    invoke-static {p0, p1}, Ljava/lang/Math;->max(II)I

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    int-to-long p0, p0

    .line 59
    const-wide/16 v1, 0x7530

    .line 60
    .line 61
    mul-long/2addr p0, v1

    .line 62
    add-long/2addr v3, p0

    .line 63
    monitor-exit v0

    .line 64
    return-wide v3

    .line 65
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 66
    throw p0
.end method

.method public onExecuted(Ll/piq0;Z)V
    .locals 2
    .param p1    # Ll/piq0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/n9k;->f:Ll/f3g0;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ll/f3g0;->e(Ll/piq0;)Ll/e3g0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v1, p0, Ll/n9k;->n:Ll/szi0;

    .line 10
    .line 11
    invoke-virtual {v1, v0}, Ll/szi0;->b(Ll/e3g0;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-virtual {p0, p1}, Ll/n9k;->g(Ll/piq0;)V

    .line 15
    .line 16
    .line 17
    if-nez p2, :cond_1

    .line 18
    .line 19
    iget-object p2, p0, Ll/n9k;->e:Ljava/lang/Object;

    .line 20
    .line 21
    monitor-enter p2

    .line 22
    :try_start_0
    iget-object p0, p0, Ll/n9k;->j:Ljava/util/Map;

    .line 23
    .line 24
    invoke-interface {p0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    monitor-exit p2

    .line 28
    return-void

    .line 29
    :catchall_0
    move-exception p0

    .line 30
    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    throw p0

    .line 32
    :cond_1
    return-void
.end method
