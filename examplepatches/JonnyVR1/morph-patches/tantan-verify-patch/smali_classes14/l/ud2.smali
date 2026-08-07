.class public Ll/ud2;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/ud2$b;
    }
.end annotation


# static fields
.field public static i:Ll/ud2;


# instance fields
.field public a:Ljava/util/concurrent/atomic/AtomicInteger;

.field public b:Landroid/os/Handler;

.field public c:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ll/od2;",
            ">;"
        }
    .end annotation
.end field

.field public d:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Ll/od2;",
            ">;"
        }
    .end annotation
.end field

.field public e:I

.field public f:J

.field public g:J

.field public h:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/ud2$b;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/ud2;->a:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 11
    .line 12
    new-instance v0, Ljava/util/HashMap;

    .line 13
    .line 14
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/ud2;->c:Ljava/util/HashMap;

    .line 18
    .line 19
    new-instance v0, Landroid/util/SparseArray;

    .line 20
    .line 21
    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Ll/ud2;->d:Landroid/util/SparseArray;

    .line 25
    .line 26
    const/4 v0, -0x1

    .line 27
    iput v0, p0, Ll/ud2;->e:I

    .line 28
    .line 29
    const-wide/16 v0, -0x1

    .line 30
    .line 31
    iput-wide v0, p0, Ll/ud2;->f:J

    .line 32
    .line 33
    iput-wide v0, p0, Ll/ud2;->g:J

    .line 34
    .line 35
    new-instance v0, Ljava/util/ArrayList;

    .line 36
    .line 37
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 38
    .line 39
    .line 40
    iput-object v0, p0, Ll/ud2;->h:Ljava/util/List;

    .line 41
    .line 42
    new-instance v0, Ll/ud2$a;

    .line 43
    .line 44
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-direct {v0, p0, v1}, Ll/ud2$a;-><init>(Ll/ud2;Landroid/os/Looper;)V

    .line 49
    .line 50
    .line 51
    iput-object v0, p0, Ll/ud2;->b:Landroid/os/Handler;

    .line 52
    .line 53
    return-void
.end method

.method public static synthetic a(Ll/ud2;Ll/od2;Landroid/view/View;Landroid/view/View;[I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/ud2;->l(Ll/od2;Landroid/view/View;Landroid/view/View;[I)V

    return-void
.end method

.method public static bridge synthetic b(Ll/ud2;II)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ud2;->f(II)V

    return-void
.end method

.method public static j()Ll/ud2;
    .locals 2

    .line 1
    sget-object v0, Ll/ud2;->i:Ll/ud2;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/ud2;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/ud2;->i:Ll/ud2;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/ud2;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/ud2;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/ud2;->i:Ll/ud2;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Ll/ud2;->i:Ll/ud2;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public final c()Landroid/util/Pair;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/Pair<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-object p0, p0, Ll/ud2;->a:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    new-instance v3, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v0, "_banner_"

    .line 24
    .line 25
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-static {v2, p0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0
.end method

.method public final d()V
    .locals 0

    .line 1
    return-void
.end method

.method public e(Ljava/lang/String;)V
    .locals 5

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    iget-object v0, p0, Ll/ud2;->c:Ljava/util/HashMap;

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Ll/od2;

    .line 15
    .line 16
    if-eqz p1, :cond_6

    .line 17
    .line 18
    if-eqz v0, :cond_6

    .line 19
    .line 20
    const/4 p1, 0x0

    .line 21
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-nez v1, :cond_5

    .line 26
    .line 27
    invoke-virtual {v0}, Ll/od2;->a()Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    if-eqz v1, :cond_4

    .line 32
    .line 33
    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    if-nez v2, :cond_1

    .line 38
    .line 39
    const/4 p1, 0x0

    .line 40
    invoke-virtual {p0, v0, p1}, Ll/ud2;->p(Ll/od2;Z)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_1
    iget-object v2, v0, Ll/od2;->r:Ll/od2$a;

    .line 45
    .line 46
    if-eqz v2, :cond_2

    .line 47
    .line 48
    invoke-interface {v2, v1}, Ll/od2$a;->a(Landroid/view/View;)Landroid/animation/Animator;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    :cond_2
    if-nez p1, :cond_3

    .line 53
    .line 54
    invoke-virtual {v0}, Ll/od2;->i()J

    .line 55
    .line 56
    .line 57
    move-result-wide v2

    .line 58
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    .line 63
    .line 64
    .line 65
    move-result v4

    .line 66
    add-int/2addr p1, v4

    .line 67
    invoke-virtual {p0, v1, v2, v3, p1}, Ll/ud2;->i(Landroid/view/View;JI)Landroid/view/ViewPropertyAnimator;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->getDuration()J

    .line 72
    .line 73
    .line 74
    move-result-wide v1

    .line 75
    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 76
    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_3
    invoke-virtual {p1}, Landroid/animation/Animator;->start()V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p1}, Landroid/animation/Animator;->getDuration()J

    .line 83
    .line 84
    .line 85
    move-result-wide v1

    .line 86
    :goto_0
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    const/4 v3, 0x2

    .line 91
    iput v3, p1, Landroid/os/Message;->what:I

    .line 92
    .line 93
    invoke-virtual {v0}, Ll/od2;->c()I

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    iput v0, p1, Landroid/os/Message;->arg1:I

    .line 98
    .line 99
    iget-object p0, p0, Ll/ud2;->b:Landroid/os/Handler;

    .line 100
    .line 101
    invoke-virtual {p0, p1, v1, v2}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 102
    .line 103
    .line 104
    return-void

    .line 105
    :cond_4
    const/4 p1, 0x1

    .line 106
    invoke-virtual {p0, v0, p1}, Ll/ud2;->p(Ll/od2;Z)V

    .line 107
    .line 108
    .line 109
    return-void

    .line 110
    :cond_5
    throw p1

    .line 111
    :cond_6
    :goto_1
    return-void
.end method

.method public final f(II)V
    .locals 4

    .line 1
    iget-wide v0, p0, Ll/ud2;->g:J

    .line 2
    .line 3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 4
    .line 5
    .line 6
    move-result-wide v2

    .line 7
    cmp-long v0, v0, v2

    .line 8
    .line 9
    if-lez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 v0, 0x4

    .line 13
    const-wide/16 v1, -0x1

    .line 14
    .line 15
    if-ne p1, v0, :cond_1

    .line 16
    .line 17
    iput-wide v1, p0, Ll/ud2;->f:J

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/ud2;->w()V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    iget-object v0, p0, Ll/ud2;->d:Landroid/util/SparseArray;

    .line 24
    .line 25
    invoke-virtual {v0, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    check-cast p2, Ll/od2;

    .line 30
    .line 31
    if-eqz p2, :cond_4

    .line 32
    .line 33
    const/4 v0, 0x1

    .line 34
    if-ne p1, v0, :cond_2

    .line 35
    .line 36
    invoke-virtual {p2}, Ll/od2;->d()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p0, p1}, Ll/ud2;->e(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_2
    const/4 v0, 0x2

    .line 45
    if-ne p1, v0, :cond_3

    .line 46
    .line 47
    invoke-virtual {p2}, Ll/od2;->d()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-virtual {p0, p1}, Ll/ud2;->o(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_3
    const/4 p2, 0x3

    .line 56
    if-ne p1, p2, :cond_4

    .line 57
    .line 58
    iput-wide v1, p0, Ll/ud2;->f:J

    .line 59
    .line 60
    invoke-virtual {p0}, Ll/ud2;->w()V

    .line 61
    .line 62
    .line 63
    :cond_4
    :goto_0
    return-void
.end method

.method public final g()Ljava/lang/String;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ud2;->d:Landroid/util/SparseArray;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    iget v0, p0, Ll/ud2;->e:I

    .line 10
    .line 11
    if-ltz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ll/ud2;->d:Landroid/util/SparseArray;

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Ll/od2;

    .line 20
    .line 21
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/od2;->d()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0

    .line 32
    :cond_0
    const/4 p0, 0x0

    .line 33
    return-object p0
.end method

.method public final h(Landroid/view/View;JI)Landroid/view/ViewPropertyAnimator;
    .locals 0

    .line 1
    invoke-static {p1}, Ll/kkl0;->c(Landroid/view/View;)Ll/hml0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    neg-int p4, p4

    .line 6
    int-to-float p4, p4

    .line 7
    invoke-virtual {p1, p4}, Landroid/view/View;->setTranslationY(F)V

    .line 8
    .line 9
    .line 10
    const/4 p4, 0x0

    .line 11
    invoke-virtual {p1, p4}, Landroid/view/View;->setAlpha(F)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p4}, Ll/hml0;->l(F)Ll/hml0;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const/high16 p4, 0x3f800000    # 1.0f

    .line 19
    .line 20
    invoke-virtual {p0, p4}, Ll/hml0;->b(F)Ll/hml0;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0, p2, p3}, Ll/hml0;->e(J)Ll/hml0;

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0
.end method

.method public final i(Landroid/view/View;JI)Landroid/view/ViewPropertyAnimator;
    .locals 0

    .line 1
    invoke-static {p1}, Ll/kkl0;->c(Landroid/view/View;)Ll/hml0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    neg-int p4, p4

    .line 6
    int-to-float p4, p4

    .line 7
    invoke-virtual {p0, p4}, Ll/hml0;->l(F)Ll/hml0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/4 p4, 0x0

    .line 12
    invoke-virtual {p0, p4}, Ll/hml0;->b(F)Ll/hml0;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0, p2, p3}, Ll/hml0;->e(J)Ll/hml0;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public k(Ll/od2;)V
    .locals 6

    .line 1
    new-instance v0, Ll/ud2$b;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/od2;->c()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-virtual {p1}, Ll/od2;->f()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    invoke-virtual {p1}, Ll/od2;->d()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    invoke-virtual {p1}, Ll/od2;->j()J

    .line 16
    .line 17
    .line 18
    move-result-wide v4

    .line 19
    invoke-direct/range {v0 .. v5}, Ll/ud2$b;-><init>(IILjava/lang/String;J)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Ll/ud2;->h:Ljava/util/List;

    .line 23
    .line 24
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    iget-object v1, p0, Ll/ud2;->h:Ljava/util/List;

    .line 29
    .line 30
    if-eqz p1, :cond_0

    .line 31
    .line 32
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    const/4 v1, 0x0

    .line 41
    :goto_0
    iget-object v2, p0, Ll/ud2;->h:Ljava/util/List;

    .line 42
    .line 43
    if-ge v1, p1, :cond_2

    .line 44
    .line 45
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    check-cast v2, Ll/ud2$b;

    .line 50
    .line 51
    iget v3, v0, Ll/ud2$b;->b:I

    .line 52
    .line 53
    iget v2, v2, Ll/ud2$b;->b:I

    .line 54
    .line 55
    if-le v3, v2, :cond_1

    .line 56
    .line 57
    iget-object p0, p0, Ll/ud2;->h:Ljava/util/List;

    .line 58
    .line 59
    invoke-interface {p0, v1, v0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_2
    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public final synthetic l(Ll/od2;Landroid/view/View;Landroid/view/View;[I)V
    .locals 4

    .line 1
    iget-object v0, p1, Ll/od2;->p:Ll/od2$c;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/od2;->d()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-interface {v0, v1, p2, p3}, Ll/od2$c;->a(Ljava/lang/String;Landroid/view/View;Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object p2, p1, Ll/od2;->r:Ll/od2$a;

    .line 13
    .line 14
    if-eqz p2, :cond_1

    .line 15
    .line 16
    invoke-interface {p2, p3}, Ll/od2$a;->b(Landroid/view/View;)Landroid/animation/Animator;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    goto :goto_0

    .line 21
    :cond_1
    const/4 p2, 0x0

    .line 22
    :goto_0
    const/4 v0, 0x0

    .line 23
    aget p4, p4, v0

    .line 24
    .line 25
    invoke-virtual {p3}, Landroid/view/View;->getHeight()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    add-int/2addr p4, v0

    .line 30
    if-nez p2, :cond_2

    .line 31
    .line 32
    invoke-virtual {p1}, Ll/od2;->h()J

    .line 33
    .line 34
    .line 35
    move-result-wide v0

    .line 36
    invoke-virtual {p0, p3, v0, v1, p4}, Ll/ud2;->h(Landroid/view/View;JI)Landroid/view/ViewPropertyAnimator;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    invoke-virtual {p2}, Landroid/view/ViewPropertyAnimator;->getDuration()J

    .line 41
    .line 42
    .line 43
    move-result-wide p3

    .line 44
    invoke-virtual {p2}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 45
    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_2
    invoke-virtual {p2}, Landroid/animation/Animator;->start()V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p2}, Landroid/animation/Animator;->getDuration()J

    .line 52
    .line 53
    .line 54
    move-result-wide p3

    .line 55
    :goto_1
    invoke-virtual {p1}, Ll/od2;->b()J

    .line 56
    .line 57
    .line 58
    move-result-wide v0

    .line 59
    const-wide/16 v2, 0x0

    .line 60
    .line 61
    cmp-long p2, v0, v2

    .line 62
    .line 63
    if-lez p2, :cond_3

    .line 64
    .line 65
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    .line 66
    .line 67
    .line 68
    move-result-object p2

    .line 69
    const/4 v0, 0x1

    .line 70
    iput v0, p2, Landroid/os/Message;->what:I

    .line 71
    .line 72
    invoke-virtual {p1}, Ll/od2;->c()I

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    iput v0, p2, Landroid/os/Message;->arg1:I

    .line 77
    .line 78
    iget-object p0, p0, Ll/ud2;->b:Landroid/os/Handler;

    .line 79
    .line 80
    invoke-virtual {p1}, Ll/od2;->b()J

    .line 81
    .line 82
    .line 83
    move-result-wide v0

    .line 84
    add-long/2addr v0, p3

    .line 85
    invoke-virtual {p0, p2, v0, v1}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 86
    .line 87
    .line 88
    :cond_3
    return-void
.end method

.method public m()V
    .locals 2

    .line 1
    const/4 v0, -0x1

    .line 2
    iput v0, p0, Ll/ud2;->e:I

    .line 3
    .line 4
    const-wide/16 v0, -0x1

    .line 5
    .line 6
    iput-wide v0, p0, Ll/ud2;->f:J

    .line 7
    .line 8
    iget-object v0, p0, Ll/ud2;->h:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/ud2;->c:Ljava/util/HashMap;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Ll/ud2;->d:Landroid/util/SparseArray;

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/util/SparseArray;->clear()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public n(J)V
    .locals 3

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    add-long/2addr v0, p1

    .line 6
    iput-wide v0, p0, Ll/ud2;->g:J

    .line 7
    .line 8
    iget-object v0, p0, Ll/ud2;->b:Landroid/os/Handler;

    .line 9
    .line 10
    const/4 v1, 0x3

    .line 11
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/ud2;->b:Landroid/os/Handler;

    .line 15
    .line 16
    const/4 v1, 0x4

    .line 17
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/ud2;->b:Landroid/os/Handler;

    .line 21
    .line 22
    const/4 v2, 0x2

    .line 23
    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeMessages(I)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/ud2;->b:Landroid/os/Handler;

    .line 27
    .line 28
    const/4 v2, 0x1

    .line 29
    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeMessages(I)V

    .line 30
    .line 31
    .line 32
    iget v0, p0, Ll/ud2;->e:I

    .line 33
    .line 34
    if-ltz v0, :cond_0

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/ud2;->g()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    if-nez v2, :cond_0

    .line 45
    .line 46
    invoke-virtual {p0, v0}, Ll/ud2;->o(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    :cond_0
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iput v1, v0, Landroid/os/Message;->what:I

    .line 54
    .line 55
    iget-object p0, p0, Ll/ud2;->b:Landroid/os/Handler;

    .line 56
    .line 57
    invoke-virtual {p0, v0, p1, p2}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public final o(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ud2;->c:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/od2;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, Ll/ud2;->d:Landroid/util/SparseArray;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/od2;->c()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    invoke-virtual {p1, v1}, Landroid/util/SparseArray;->remove(I)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ll/od2;->c()I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    invoke-virtual {p0, p1}, Ll/ud2;->q(I)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Ll/od2;->a()Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    if-eqz p1, :cond_0

    .line 34
    .line 35
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    instance-of v1, v0, Landroid/view/ViewGroup;

    .line 40
    .line 41
    if-eqz v1, :cond_0

    .line 42
    .line 43
    check-cast v0, Landroid/view/ViewGroup;

    .line 44
    .line 45
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 46
    .line 47
    .line 48
    :cond_0
    const/4 p1, -0x1

    .line 49
    iput p1, p0, Ll/ud2;->e:I

    .line 50
    .line 51
    const/4 p1, 0x1

    .line 52
    invoke-virtual {p0, p1}, Ll/ud2;->x(Z)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public final p(Ll/od2;Z)V
    .locals 3

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p0, Ll/ud2;->c:Ljava/util/HashMap;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/od2;->d()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/ud2;->d:Landroid/util/SparseArray;

    .line 13
    .line 14
    invoke-virtual {p1}, Ll/od2;->c()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->remove(I)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/ud2;->h:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_1

    .line 28
    .line 29
    iget-object v0, p0, Ll/ud2;->h:Ljava/util/List;

    .line 30
    .line 31
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-eqz v1, :cond_1

    .line 40
    .line 41
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    check-cast v1, Ll/ud2$b;

    .line 46
    .line 47
    iget v1, v1, Ll/ud2$b;->a:I

    .line 48
    .line 49
    invoke-virtual {p1}, Ll/od2;->c()I

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    if-ne v1, v2, :cond_0

    .line 54
    .line 55
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 56
    .line 57
    .line 58
    :cond_1
    if-eqz p2, :cond_2

    .line 59
    .line 60
    invoke-virtual {p0}, Ll/ud2;->w()V

    .line 61
    .line 62
    .line 63
    :cond_2
    return-void
.end method

.method public final q(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ud2;->h:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object p0, p0, Ll/ud2;->h:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Ll/ud2$b;

    .line 26
    .line 27
    iget v0, v0, Ll/ud2$b;->a:I

    .line 28
    .line 29
    if-ne v0, p1, :cond_0

    .line 30
    .line 31
    invoke-interface {p0}, Ljava/util/Iterator;->remove()V

    .line 32
    .line 33
    .line 34
    :cond_1
    return-void
.end method

.method public r()V
    .locals 3

    .line 1
    const-wide/16 v0, -0x1

    .line 2
    .line 3
    iput-wide v0, p0, Ll/ud2;->g:J

    .line 4
    .line 5
    iget-object v0, p0, Ll/ud2;->b:Landroid/os/Handler;

    .line 6
    .line 7
    const/4 v1, 0x4

    .line 8
    invoke-virtual {v0, v1}, Landroid/os/Handler;->hasMessages(I)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput v1, v0, Landroid/os/Message;->what:I

    .line 19
    .line 20
    iget-object p0, p0, Ll/ud2;->b:Landroid/os/Handler;

    .line 21
    .line 22
    const-wide/16 v1, 0xc8

    .line 23
    .line 24
    invoke-virtual {p0, v0, v1, v2}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public s(Ll/od2;)Ljava/lang/String;
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ud2;->d()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/ud2;->c()Landroid/util/Pair;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v1, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast v1, Ljava/lang/String;

    .line 11
    .line 12
    iget-object v0, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast v0, Ljava/lang/Integer;

    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    invoke-virtual {p1, v0, v1}, Ll/od2;->r(ILjava/lang/String;)Ll/od2;

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, p1}, Ll/ud2;->v(Ll/od2;)V

    .line 24
    .line 25
    .line 26
    return-object v1
.end method

.method public t(Ll/od2;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ud2;->d()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/ud2;->c:Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-virtual {v0, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Ll/od2;

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object v0, p0, Ll/ud2;->a:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    invoke-virtual {p1, v0, p2}, Ll/od2;->r(ILjava/lang/String;)Ll/od2;

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, p1}, Ll/ud2;->v(Ll/od2;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final u(Ll/od2;)V
    .locals 12

    .line 1
    invoke-virtual {p1}, Ll/od2;->l()Landroid/view/ViewGroup;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Ll/od2;->g()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const/4 v2, 0x1

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    if-eqz v1, :cond_1

    .line 13
    .line 14
    invoke-virtual {p1}, Ll/od2;->e()I

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    invoke-static {v1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 19
    .line 20
    .line 21
    move-result-object v4

    .line 22
    const/4 v5, 0x0

    .line 23
    invoke-virtual {v4, v3, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v9

    .line 27
    invoke-virtual {p1, v9}, Ll/od2;->t(Landroid/view/View;)Ll/od2;

    .line 28
    .line 29
    .line 30
    new-instance v3, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 31
    .line 32
    const/4 v4, -0x1

    .line 33
    const/4 v5, -0x2

    .line 34
    invoke-direct {v3, v4, v5}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1}, Ll/od2;->k()[I

    .line 38
    .line 39
    .line 40
    move-result-object v11

    .line 41
    invoke-virtual {p1}, Ll/od2;->m()Z

    .line 42
    .line 43
    .line 44
    move-result v6

    .line 45
    const/4 v7, 0x2

    .line 46
    const/4 v8, 0x0

    .line 47
    if-eqz v6, :cond_0

    .line 48
    .line 49
    new-instance v6, Landroidx/cardview/widget/CardView;

    .line 50
    .line 51
    invoke-direct {v6, v1}, Landroidx/cardview/widget/CardView;-><init>(Landroid/content/Context;)V

    .line 52
    .line 53
    .line 54
    const/4 v10, 0x3

    .line 55
    aget v10, v11, v10

    .line 56
    .line 57
    int-to-float v10, v10

    .line 58
    invoke-virtual {v6, v10}, Landroidx/cardview/widget/CardView;->setRadius(F)V

    .line 59
    .line 60
    .line 61
    new-instance v10, Landroid/widget/FrameLayout$LayoutParams;

    .line 62
    .line 63
    invoke-direct {v10, v4, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v6, v9, v10}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 67
    .line 68
    .line 69
    iget v10, p1, Ll/od2;->o:F

    .line 70
    .line 71
    invoke-virtual {v6, v10}, Landroidx/cardview/widget/CardView;->setCardElevation(F)V

    .line 72
    .line 73
    .line 74
    new-instance v10, Landroid/widget/FrameLayout;

    .line 75
    .line 76
    invoke-direct {v10, v1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 77
    .line 78
    .line 79
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 80
    .line 81
    invoke-direct {v1, v4, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 82
    .line 83
    .line 84
    aget v4, v11, v8

    .line 85
    .line 86
    iput v4, v1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 87
    .line 88
    aget v2, v11, v2

    .line 89
    .line 90
    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 91
    .line 92
    aget v2, v11, v7

    .line 93
    .line 94
    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 95
    .line 96
    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 97
    .line 98
    invoke-virtual {v10, v6, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 99
    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_0
    new-instance v10, Landroid/widget/FrameLayout;

    .line 103
    .line 104
    invoke-direct {v10, v1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 105
    .line 106
    .line 107
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 108
    .line 109
    invoke-direct {v1, v4, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 110
    .line 111
    .line 112
    aget v4, v11, v8

    .line 113
    .line 114
    iput v4, v1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 115
    .line 116
    aget v2, v11, v2

    .line 117
    .line 118
    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 119
    .line 120
    aget v2, v11, v7

    .line 121
    .line 122
    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 123
    .line 124
    invoke-virtual {v10, v9, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 125
    .line 126
    .line 127
    :goto_0
    invoke-virtual {p1, v10}, Ll/od2;->o(Landroid/view/View;)Ll/od2;

    .line 128
    .line 129
    .line 130
    invoke-virtual {v0, v10, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {p1, v9}, Ll/od2;->n(Landroid/view/View;)V

    .line 134
    .line 135
    .line 136
    invoke-virtual {p1}, Ll/od2;->c()I

    .line 137
    .line 138
    .line 139
    move-result v0

    .line 140
    iput v0, p0, Ll/ud2;->e:I

    .line 141
    .line 142
    const/4 v0, 0x0

    .line 143
    invoke-virtual {v10, v0}, Landroid/view/View;->setAlpha(F)V

    .line 144
    .line 145
    .line 146
    new-instance v6, Ll/td2;

    .line 147
    .line 148
    move-object v7, p0

    .line 149
    move-object v8, p1

    .line 150
    invoke-direct/range {v6 .. v11}, Ll/td2;-><init>(Ll/ud2;Ll/od2;Landroid/view/View;Landroid/view/View;[I)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {v10, v6}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 154
    .line 155
    .line 156
    return-void

    .line 157
    :cond_1
    move-object v7, p0

    .line 158
    move-object v8, p1

    .line 159
    invoke-virtual {v7, v8, v2}, Ll/ud2;->p(Ll/od2;Z)V

    .line 160
    .line 161
    .line 162
    return-void
.end method

.method public v(Ll/od2;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ud2;->d:Landroid/util/SparseArray;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/od2;->c()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-virtual {v0, v1, p1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/ud2;->c:Ljava/util/HashMap;

    .line 11
    .line 12
    invoke-virtual {p1}, Ll/od2;->d()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ll/ud2;->k(Ll/od2;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ll/ud2;->w()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final w()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Ll/ud2;->x(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final x(Z)V
    .locals 6

    .line 1
    iget-wide v0, p0, Ll/ud2;->g:J

    .line 2
    .line 3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 4
    .line 5
    .line 6
    move-result-wide v2

    .line 7
    cmp-long v0, v0, v2

    .line 8
    .line 9
    if-lez v0, :cond_0

    .line 10
    .line 11
    goto/16 :goto_0

    .line 12
    .line 13
    :cond_0
    iget-object v0, p0, Ll/ud2;->h:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_4

    .line 20
    .line 21
    iget v0, p0, Ll/ud2;->e:I

    .line 22
    .line 23
    const/4 v1, -0x1

    .line 24
    if-ne v0, v1, :cond_4

    .line 25
    .line 26
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 27
    .line 28
    .line 29
    move-result-wide v0

    .line 30
    iget-wide v2, p0, Ll/ud2;->f:J

    .line 31
    .line 32
    cmp-long v0, v0, v2

    .line 33
    .line 34
    const/4 v1, 0x3

    .line 35
    if-ltz v0, :cond_3

    .line 36
    .line 37
    const-wide/16 v4, -0x1

    .line 38
    .line 39
    cmp-long v0, v2, v4

    .line 40
    .line 41
    const/4 v2, 0x0

    .line 42
    if-nez v0, :cond_1

    .line 43
    .line 44
    if-nez p1, :cond_1

    .line 45
    .line 46
    iget-object p1, p0, Ll/ud2;->h:Ljava/util/List;

    .line 47
    .line 48
    invoke-interface {p1, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    check-cast p1, Ll/ud2$b;

    .line 53
    .line 54
    iget-object v0, p0, Ll/ud2;->c:Ljava/util/HashMap;

    .line 55
    .line 56
    iget-object p1, p1, Ll/ud2$b;->c:Ljava/lang/String;

    .line 57
    .line 58
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    check-cast p1, Ll/od2;

    .line 63
    .line 64
    if-eqz p1, :cond_4

    .line 65
    .line 66
    invoke-virtual {p0, p1}, Ll/ud2;->u(Ll/od2;)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_1
    iget-object v0, p0, Ll/ud2;->h:Ljava/util/List;

    .line 71
    .line 72
    if-eqz p1, :cond_2

    .line 73
    .line 74
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    check-cast p1, Ll/ud2$b;

    .line 79
    .line 80
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 81
    .line 82
    .line 83
    move-result-wide v2

    .line 84
    iget-wide v4, p1, Ll/ud2$b;->d:J

    .line 85
    .line 86
    add-long/2addr v2, v4

    .line 87
    iput-wide v2, p0, Ll/ud2;->f:J

    .line 88
    .line 89
    iget-object v0, p0, Ll/ud2;->b:Landroid/os/Handler;

    .line 90
    .line 91
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 92
    .line 93
    .line 94
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    iput v1, v0, Landroid/os/Message;->what:I

    .line 99
    .line 100
    iget v1, p1, Ll/ud2$b;->a:I

    .line 101
    .line 102
    iput v1, v0, Landroid/os/Message;->arg1:I

    .line 103
    .line 104
    iget-object p0, p0, Ll/ud2;->b:Landroid/os/Handler;

    .line 105
    .line 106
    iget-wide v1, p1, Ll/ud2$b;->d:J

    .line 107
    .line 108
    invoke-virtual {p0, v0, v1, v2}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 109
    .line 110
    .line 111
    return-void

    .line 112
    :cond_2
    invoke-interface {v0, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    check-cast p1, Ll/ud2$b;

    .line 117
    .line 118
    iget-object v0, p0, Ll/ud2;->c:Ljava/util/HashMap;

    .line 119
    .line 120
    iget-object p1, p1, Ll/ud2$b;->c:Ljava/lang/String;

    .line 121
    .line 122
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    check-cast p1, Ll/od2;

    .line 127
    .line 128
    if-eqz p1, :cond_4

    .line 129
    .line 130
    invoke-virtual {p0, p1}, Ll/ud2;->u(Ll/od2;)V

    .line 131
    .line 132
    .line 133
    return-void

    .line 134
    :cond_3
    iget-object p1, p0, Ll/ud2;->b:Landroid/os/Handler;

    .line 135
    .line 136
    invoke-virtual {p1, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 137
    .line 138
    .line 139
    iget-object p1, p0, Ll/ud2;->b:Landroid/os/Handler;

    .line 140
    .line 141
    const/4 v0, 0x4

    .line 142
    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeMessages(I)V

    .line 143
    .line 144
    .line 145
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    iput v0, p1, Landroid/os/Message;->what:I

    .line 150
    .line 151
    iget-object v0, p0, Ll/ud2;->b:Landroid/os/Handler;

    .line 152
    .line 153
    iget-wide v1, p0, Ll/ud2;->f:J

    .line 154
    .line 155
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 156
    .line 157
    .line 158
    move-result-wide v3

    .line 159
    sub-long/2addr v1, v3

    .line 160
    invoke-virtual {v0, p1, v1, v2}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 161
    .line 162
    .line 163
    :cond_4
    :goto_0
    return-void
.end method
