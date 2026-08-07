.class public Ll/j1e;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/j1e$b;
    }
.end annotation


# static fields
.field public static final e:Ll/j1e;


# instance fields
.field public a:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Ll/j1e$b;",
            ">;"
        }
    .end annotation
.end field

.field public b:Ll/l01;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/l01<",
            "Ljava/lang/ref/WeakReference<",
            "Landroid/content/Context;",
            ">;",
            "Ljava/util/Queue<",
            "Ll/j1e$b;",
            ">;>;"
        }
    .end annotation
.end field

.field public c:Ll/l01;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/l01<",
            "Ljava/lang/ref/WeakReference<",
            "Landroid/content/Context;",
            ">;",
            "Ll/j1e$b;",
            ">;"
        }
    .end annotation
.end field

.field public d:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/j1e;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/j1e;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/j1e;->e:Ll/j1e;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/i1e;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/i1e;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/j1e;->a:Ljava/util/Comparator;

    .line 10
    .line 11
    new-instance v0, Ll/l01;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/l01;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/j1e;->b:Ll/l01;

    .line 17
    .line 18
    new-instance v0, Ll/l01;

    .line 19
    .line 20
    invoke-direct {v0}, Ll/l01;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/j1e;->c:Ll/l01;

    .line 24
    .line 25
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 26
    .line 27
    new-instance v1, Ll/j1e$a;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/j1e$a;-><init>(Ll/j1e;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v1}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public static synthetic a(Ll/j1e$b;Ll/j1e$b;)I
    .locals 2

    .line 1
    invoke-interface {p1}, Ll/j1e$b;->getPriority()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-interface {p0}, Ll/j1e$b;->getPriority()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    invoke-interface {p0}, Ll/j1e$b;->c()J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    invoke-interface {p1}, Ll/j1e$b;->c()J

    .line 16
    .line 17
    .line 18
    move-result-wide p0

    .line 19
    invoke-static {v0, v1, p0, p1}, Ljava/lang/Long;->compare(JJ)I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0

    .line 24
    :cond_0
    invoke-interface {p1}, Ll/j1e$b;->getPriority()I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    invoke-interface {p0}, Ll/j1e$b;->getPriority()I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    sub-int/2addr p1, p0

    .line 33
    return p1
.end method

.method public static bridge synthetic b(Ll/j1e;Ljava/lang/ref/WeakReference;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/j1e;->d:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method public static bridge synthetic c(Ll/j1e;Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/j1e;->k(Landroid/content/Context;)V

    return-void
.end method

.method public static i()Ll/j1e;
    .locals 1

    .line 1
    sget-object v0, Ll/j1e;->e:Ll/j1e;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public d(Landroid/content/Context;Ll/j1e$b;)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Ll/j1e;->d:Ljava/lang/ref/WeakReference;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Landroid/content/Context;

    .line 10
    .line 11
    :cond_0
    invoke-virtual {p0, p1}, Ll/j1e;->g(Landroid/content/Context;)Ljava/lang/ref/WeakReference;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Ll/j1e;->c:Ll/l01;

    .line 16
    .line 17
    invoke-virtual {v1, v0}, Ll/oof0;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    iget-object v1, p0, Ll/j1e;->c:Ll/l01;

    .line 24
    .line 25
    invoke-virtual {v1, v0}, Ll/oof0;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    check-cast v1, Ll/j1e$b;

    .line 30
    .line 31
    invoke-interface {v1}, Ll/j1e$b;->isShowing()Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-nez v1, :cond_1

    .line 36
    .line 37
    iget-object v1, p0, Ll/j1e;->c:Ll/l01;

    .line 38
    .line 39
    invoke-virtual {v1, v0}, Ll/oof0;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    :cond_1
    invoke-virtual {p0, v0}, Ll/j1e;->h(Ljava/lang/ref/WeakReference;)Ljava/util/Queue;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-interface {v0, p2}, Ljava/util/Queue;->offer(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    const/4 p2, 0x0

    .line 50
    invoke-virtual {p0, p1, p2}, Ll/j1e;->l(Landroid/content/Context;Z)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final e(Landroid/content/Context;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final f(Landroid/content/Context;)Ljava/lang/ref/WeakReference;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/lang/ref/WeakReference<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/j1e;->b:Ll/l01;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/l01;->keySet()Ljava/util/Set;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Ljava/lang/ref/WeakReference;

    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    if-ne p1, v1, :cond_0

    .line 28
    .line 29
    return-object v0

    .line 30
    :cond_1
    const/4 p0, 0x0

    .line 31
    return-object p0
.end method

.method public final g(Landroid/content/Context;)Ljava/lang/ref/WeakReference;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/lang/ref/WeakReference<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Ll/j1e;->f(Landroid/content/Context;)Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    new-instance p0, Ljava/lang/ref/WeakReference;

    .line 8
    .line 9
    invoke-direct {p0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-object p0
.end method

.method public final h(Ljava/lang/ref/WeakReference;)Ljava/util/Queue;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ref/WeakReference<",
            "Landroid/content/Context;",
            ">;)",
            "Ljava/util/Queue<",
            "Ll/j1e$b;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Landroid/content/Context;

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ll/j1e;->e(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/j1e;->b:Ll/l01;

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Ll/oof0;->containsKey(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Ll/j1e;->b:Ll/l01;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Ll/oof0;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    check-cast p0, Ljava/util/Queue;

    .line 25
    .line 26
    return-object p0

    .line 27
    :cond_0
    new-instance v0, Ljava/util/PriorityQueue;

    .line 28
    .line 29
    const/4 v1, 0x4

    .line 30
    iget-object v2, p0, Ll/j1e;->a:Ljava/util/Comparator;

    .line 31
    .line 32
    invoke-direct {v0, v1, v2}, Ljava/util/PriorityQueue;-><init>(ILjava/util/Comparator;)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Ll/j1e;->b:Ll/l01;

    .line 36
    .line 37
    invoke-virtual {p0, p1, v0}, Ll/oof0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    return-object v0
.end method

.method public j(Landroid/content/Context;Ll/j1e$b;)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Ll/j1e;->d:Ljava/lang/ref/WeakReference;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Landroid/content/Context;

    .line 10
    .line 11
    :cond_0
    invoke-virtual {p0, p1}, Ll/j1e;->g(Landroid/content/Context;)Ljava/lang/ref/WeakReference;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Ll/j1e;->h(Ljava/lang/ref/WeakReference;)Ljava/util/Queue;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-interface {p0, p2}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final k(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Ll/j1e;->f(Landroid/content/Context;)Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/j1e;->b:Ll/l01;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Ll/oof0;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/j1e;->c:Ll/l01;

    .line 13
    .line 14
    invoke-virtual {v0, p1}, Ll/oof0;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object p1, p0, Ll/j1e;->b:Ll/l01;

    .line 18
    .line 19
    invoke-virtual {p1}, Ll/l01;->keySet()Ljava/util/Set;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    :cond_1
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Ljava/lang/ref/WeakReference;

    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    if-nez v1, :cond_1

    .line 44
    .line 45
    iget-object v1, p0, Ll/j1e;->b:Ll/l01;

    .line 46
    .line 47
    invoke-virtual {v1, v0}, Ll/oof0;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_2
    return-void
.end method

.method public l(Landroid/content/Context;Z)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Ll/j1e;->d:Ljava/lang/ref/WeakReference;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Landroid/content/Context;

    .line 10
    .line 11
    invoke-virtual {p0, p1, p2}, Ll/j1e;->m(Landroid/content/Context;Z)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-virtual {p0, p1, p2}, Ll/j1e;->m(Landroid/content/Context;Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final m(Landroid/content/Context;Z)V
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Ll/j1e;->g(Landroid/content/Context;)Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    iget-object p2, p0, Ll/j1e;->c:Ll/l01;

    .line 8
    .line 9
    invoke-virtual {p2, p1}, Ll/oof0;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    if-eqz p2, :cond_0

    .line 14
    .line 15
    iget-object p2, p0, Ll/j1e;->c:Ll/l01;

    .line 16
    .line 17
    invoke-virtual {p2, p1}, Ll/oof0;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    check-cast p2, Ll/j1e$b;

    .line 22
    .line 23
    invoke-interface {p2}, Ll/j1e$b;->isShowing()Z

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    if-nez p2, :cond_0

    .line 28
    .line 29
    iget-object p2, p0, Ll/j1e;->c:Ll/l01;

    .line 30
    .line 31
    invoke-virtual {p2, p1}, Ll/oof0;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    :cond_0
    invoke-virtual {p0, p1}, Ll/j1e;->h(Ljava/lang/ref/WeakReference;)Ljava/util/Queue;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    invoke-interface {p2}, Ljava/util/Queue;->peek()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Ll/j1e$b;

    .line 43
    .line 44
    if-nez v0, :cond_1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    iget-object v1, p0, Ll/j1e;->c:Ll/l01;

    .line 48
    .line 49
    invoke-virtual {v1, p1}, Ll/oof0;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    if-nez v1, :cond_2

    .line 54
    .line 55
    invoke-interface {p2}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    invoke-interface {v0}, Ll/j1e$b;->p()V

    .line 59
    .line 60
    .line 61
    iget-object p0, p0, Ll/j1e;->c:Ll/l01;

    .line 62
    .line 63
    invoke-virtual {p0, p1, v0}, Ll/oof0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_2
    invoke-interface {v0}, Ll/j1e$b;->getPriority()I

    .line 68
    .line 69
    .line 70
    move-result p2

    .line 71
    const v0, 0x7ffffc17

    .line 72
    .line 73
    .line 74
    if-ne p2, v0, :cond_3

    .line 75
    .line 76
    iget-object p0, p0, Ll/j1e;->c:Ll/l01;

    .line 77
    .line 78
    invoke-virtual {p0, p1}, Ll/oof0;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    check-cast p0, Ll/j1e$b;

    .line 83
    .line 84
    if-eqz p0, :cond_3

    .line 85
    .line 86
    invoke-interface {p0}, Ll/j1e$b;->isShowing()Z

    .line 87
    .line 88
    .line 89
    move-result p1

    .line 90
    if-eqz p1, :cond_3

    .line 91
    .line 92
    invoke-interface {p0}, Ll/j1e$b;->dismiss()V

    .line 93
    .line 94
    .line 95
    :cond_3
    :goto_0
    return-void
.end method
