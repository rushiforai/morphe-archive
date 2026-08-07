.class public Ll/cl80;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/cl80$b;
    }
.end annotation


# instance fields
.field public final a:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/PriorityQueue<",
            "Ll/al80;",
            ">;>;"
        }
    .end annotation
.end field

.field public b:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field public final c:Landroid/app/Application$ActivityLifecycleCallbacks;


# direct methods
.method public constructor <init>()V
    .locals 1

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
    iput-object v0, p0, Ll/cl80;->a:Ljava/util/Map;

    .line 10
    .line 11
    new-instance v0, Ll/cl80$a;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/cl80$a;-><init>(Ll/cl80;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/cl80;->c:Landroid/app/Application$ActivityLifecycleCallbacks;

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic a(Ll/cl80;Ll/al80;Ll/d3m;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/cl80;->l(Ll/al80;Ll/d3m;)V

    return-void
.end method

.method public static bridge synthetic b(Ll/cl80;Ljava/lang/ref/WeakReference;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/cl80;->b:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method public static bridge synthetic c(Ll/cl80;Landroid/app/Activity;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cl80;->o(Landroid/app/Activity;)V

    return-void
.end method

.method public static e()Ll/cl80;
    .locals 1

    .line 1
    invoke-static {}, Ll/cl80$b;->a()Ll/cl80;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method


# virtual methods
.method public final d(Ll/al80;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Ll/al80;->f()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    const-string v0, "manager step dismiss"

    .line 5
    .line 6
    invoke-virtual {p0, v0, p1}, Ll/cl80;->m(Ljava/lang/String;Ll/al80;)V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p1, v0}, Ll/al80;->q(Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/cl80;->a:Ljava/util/Map;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/cl80;->g()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Ljava/util/PriorityQueue;

    .line 24
    .line 25
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-nez v1, :cond_0

    .line 30
    .line 31
    invoke-virtual {v0, p1}, Ljava/util/PriorityQueue;->remove(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    :cond_0
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-eqz p1, :cond_1

    .line 39
    .line 40
    const/4 p1, 0x0

    .line 41
    goto :goto_0

    .line 42
    :cond_1
    invoke-virtual {v0}, Ljava/util/PriorityQueue;->poll()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    check-cast p1, Ll/al80;

    .line 47
    .line 48
    :goto_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-eqz v1, :cond_2

    .line 53
    .line 54
    invoke-virtual {p1}, Ll/al80;->h()I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    const/4 v2, 0x1

    .line 59
    if-eq v1, v2, :cond_2

    .line 60
    .line 61
    const-string v1, "manager step dismiss next "

    .line 62
    .line 63
    invoke-virtual {p0, v1, p1}, Ll/cl80;->m(Ljava/lang/String;Ll/al80;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0, p1}, Ll/cl80;->n(Ll/al80;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0}, Ljava/util/PriorityQueue;->clear()V

    .line 70
    .line 71
    .line 72
    :cond_2
    return-void
.end method

.method public f()Ll/al80;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cl80;->a:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/cl80;->a:Ljava/util/Map;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/cl80;->g()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Ljava/util/PriorityQueue;

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
    invoke-virtual {p0}, Ljava/util/PriorityQueue;->size()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-lez v0, :cond_0

    .line 32
    .line 33
    invoke-virtual {p0}, Ljava/util/PriorityQueue;->peek()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_0

    .line 42
    .line 43
    invoke-virtual {p0}, Ljava/util/PriorityQueue;->peek()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    check-cast v0, Ll/al80;

    .line 48
    .line 49
    invoke-virtual {v0}, Ll/al80;->m()Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-nez v0, :cond_0

    .line 54
    .line 55
    invoke-virtual {p0}, Ljava/util/PriorityQueue;->peek()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    check-cast p0, Ll/al80;

    .line 60
    .line 61
    return-object p0

    .line 62
    :cond_0
    const/4 p0, 0x0

    .line 63
    return-object p0
.end method

.method public final g()Ljava/lang/String;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Ll/cl80;->h(Landroid/app/Activity;)Ljava/lang/String;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public final h(Landroid/app/Activity;)Ljava/lang/String;
    .locals 3

    .line 1
    if-nez p1, :cond_1

    .line 2
    .line 3
    iget-object p1, p0, Ll/cl80;->b:Ljava/lang/ref/WeakReference;

    .line 4
    .line 5
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/cl80;->b:Ljava/lang/ref/WeakReference;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    move-object p1, p0

    .line 18
    check-cast p1, Landroid/app/Activity;

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/4 p1, 0x0

    .line 22
    :cond_1
    :goto_0
    if-nez p1, :cond_2

    .line 23
    .line 24
    const-string p0, "p_default_view"

    .line 25
    .line 26
    return-object p0

    .line 27
    :cond_2
    instance-of p0, p1, Lcom/p1/mobile/android/app/Act;

    .line 28
    .line 29
    if-eqz p0, :cond_4

    .line 30
    .line 31
    move-object p0, p1

    .line 32
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 33
    .line 34
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->t0()Ljava/util/List;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    const/4 v0, 0x0

    .line 43
    :goto_1
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-ge v0, v1, :cond_4

    .line 48
    .line 49
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    check-cast v1, Landroidx/fragment/app/Fragment;

    .line 54
    .line 55
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    if-eqz v2, :cond_3

    .line 60
    .line 61
    instance-of v2, v1, Lcom/p1/mobile/android/app/Frag;

    .line 62
    .line 63
    if-eqz v2, :cond_3

    .line 64
    .line 65
    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->isVisible()Z

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    if-eqz v2, :cond_3

    .line 70
    .line 71
    check-cast v1, Lcom/p1/mobile/android/app/Frag;

    .line 72
    .line 73
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Frag;->pageId()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    goto :goto_2

    .line 78
    :cond_3
    add-int/lit8 v0, v0, 0x1

    .line 79
    .line 80
    goto :goto_1

    .line 81
    :cond_4
    const-string p0, ""

    .line 82
    .line 83
    :goto_2
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    if-eqz v0, :cond_5

    .line 88
    .line 89
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    .line 90
    .line 91
    .line 92
    move-result p0

    .line 93
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    :cond_5
    return-object p0
.end method

.method public final i(Landroid/app/Activity;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    if-nez p1, :cond_1

    .line 7
    .line 8
    iget-object p1, p0, Ll/cl80;->b:Ljava/lang/ref/WeakReference;

    .line 9
    .line 10
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Ll/cl80;->b:Ljava/lang/ref/WeakReference;

    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    move-object p1, p0

    .line 23
    check-cast p1, Landroid/app/Activity;

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 p1, 0x0

    .line 27
    :cond_1
    :goto_0
    if-nez p1, :cond_2

    .line 28
    .line 29
    const-string p0, "p_default_view"

    .line 30
    .line 31
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    return-object v0

    .line 35
    :cond_2
    instance-of p0, p1, Lcom/p1/mobile/android/app/Act;

    .line 36
    .line 37
    if-eqz p0, :cond_4

    .line 38
    .line 39
    move-object p0, p1

    .line 40
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 41
    .line 42
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->t0()Ljava/util/List;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    const/4 v1, 0x0

    .line 51
    :goto_1
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    if-ge v1, v2, :cond_4

    .line 56
    .line 57
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    check-cast v2, Landroidx/fragment/app/Fragment;

    .line 62
    .line 63
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result v3

    .line 67
    if-eqz v3, :cond_3

    .line 68
    .line 69
    instance-of v3, v2, Lcom/p1/mobile/android/app/Frag;

    .line 70
    .line 71
    if-eqz v3, :cond_3

    .line 72
    .line 73
    check-cast v2, Lcom/p1/mobile/android/app/Frag;

    .line 74
    .line 75
    invoke-virtual {v2}, Lcom/p1/mobile/android/app/Frag;->pageId()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    :cond_3
    add-int/lit8 v1, v1, 0x1

    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_4
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 86
    .line 87
    .line 88
    move-result p0

    .line 89
    if-eqz p0, :cond_5

    .line 90
    .line 91
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    .line 92
    .line 93
    .line 94
    move-result p0

    .line 95
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    :cond_5
    return-object v0
.end method

.method public j()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 2
    .line 3
    iget-object p0, p0, Ll/cl80;->c:Landroid/app/Application$ActivityLifecycleCallbacks;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public k()Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cl80;->a:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    iget-object v0, p0, Ll/cl80;->a:Ljava/util/Map;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/cl80;->g()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Ljava/util/PriorityQueue;

    .line 22
    .line 23
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_1

    .line 28
    .line 29
    invoke-virtual {p0}, Ljava/util/PriorityQueue;->peek()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    invoke-virtual {p0}, Ljava/util/PriorityQueue;->peek()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    check-cast p0, Ll/al80;

    .line 44
    .line 45
    invoke-virtual {p0}, Ll/al80;->m()Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    if-eqz p0, :cond_1

    .line 50
    .line 51
    const/4 p0, 0x1

    .line 52
    return p0

    .line 53
    :cond_1
    return v1
.end method

.method public final synthetic l(Ll/al80;Ll/d3m;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cl80;->d(Ll/al80;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public m(Ljava/lang/String;Ll/al80;)V
    .locals 1
    .param p2    # Ll/al80;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    const-string p1, " , act: "

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/cl80;->g()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string p0, " , build: "

    .line 22
    .line 23
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    if-eqz p2, :cond_0

    .line 27
    .line 28
    invoke-virtual {p2}, Ljava/lang/Object;->hashCode()I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    goto :goto_0

    .line 37
    :cond_0
    const-string p0, "null"

    .line 38
    .line 39
    :goto_0
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    const-string p1, "[PopUp]"

    .line 47
    .line 48
    invoke-static {p1, p0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public final n(Ll/al80;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Ll/al80;->g()Ll/f3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Ll/al80;->f()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-interface {v0}, Ll/f3m;->isValid()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    const-string v0, "manager step real show valid"

    .line 21
    .line 22
    invoke-virtual {p0, v0, p1}, Ll/cl80;->m(Ljava/lang/String;Ll/al80;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1}, Ll/al80;->g()Ll/f3m;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Ll/bl80;

    .line 30
    .line 31
    invoke-direct {v1, p0, p1}, Ll/bl80;-><init>(Ll/cl80;Ll/al80;)V

    .line 32
    .line 33
    .line 34
    invoke-interface {v0, v1}, Ll/a3m;->i(Ll/z2m;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1}, Ll/al80;->g()Ll/f3m;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-interface {v0, p1}, Ll/f3m;->h(Ll/al80;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    goto :goto_0

    .line 46
    :cond_0
    const/4 v0, 0x0

    .line 47
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 48
    .line 49
    const-string v2, "manager step real show back "

    .line 50
    .line 51
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {p0, v1, p1}, Ll/cl80;->m(Ljava/lang/String;Ll/al80;)V

    .line 62
    .line 63
    .line 64
    if-eqz v0, :cond_1

    .line 65
    .line 66
    invoke-virtual {p0}, Ll/cl80;->g()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    new-instance v1, Ljava/util/PriorityQueue;

    .line 71
    .line 72
    invoke-direct {v1}, Ljava/util/PriorityQueue;-><init>()V

    .line 73
    .line 74
    .line 75
    :try_start_0
    invoke-virtual {v1, p1}, Ljava/util/PriorityQueue;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 76
    .line 77
    .line 78
    :catch_0
    iget-object p0, p0, Ll/cl80;->a:Ljava/util/Map;

    .line 79
    .line 80
    invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    const/4 p0, 0x1

    .line 84
    invoke-virtual {p1, p0}, Ll/al80;->q(Z)V

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    :cond_1
    invoke-virtual {p0}, Ll/cl80;->s()V

    .line 89
    .line 90
    .line 91
    return-void
.end method

.method public final o(Landroid/app/Activity;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cl80;->a:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    iget-object v0, p0, Ll/cl80;->a:Ljava/util/Map;

    .line 11
    .line 12
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p0, p1}, Ll/cl80;->i(Landroid/app/Activity;)Ljava/util/List;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-eqz p1, :cond_2

    .line 29
    .line 30
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-nez p1, :cond_2

    .line 35
    .line 36
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    check-cast p1, Ljava/util/Map$Entry;

    .line 41
    .line 42
    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    if-eqz p1, :cond_1

    .line 51
    .line 52
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_2
    :goto_1
    return-void
.end method

.method public p()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cl80;->a:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 4
    .line 5
    .line 6
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 7
    .line 8
    iget-object p0, p0, Ll/cl80;->c:Landroid/app/Application$ActivityLifecycleCallbacks;

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Landroid/app/Application;->unregisterActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public q(Ll/al80;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Ll/cl80;->r(Ll/al80;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final r(Ll/al80;Z)V
    .locals 6

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "manager start show: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Ll/al80;->h()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0, v0, p1}, Ll/cl80;->m(Ljava/lang/String;Ll/al80;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/cl80;->a:Ljava/util/Map;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/cl80;->g()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Ljava/util/PriorityQueue;

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/cl80;->g()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_0

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    invoke-virtual {v0}, Ljava/util/PriorityQueue;->size()I

    .line 45
    .line 46
    .line 47
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 48
    .line 49
    const-string v2, "manager start step1: "

    .line 50
    .line 51
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    if-eqz v2, :cond_1

    .line 59
    .line 60
    const/4 v2, 0x0

    .line 61
    goto :goto_1

    .line 62
    :cond_1
    invoke-virtual {v0}, Ljava/util/PriorityQueue;->size()I

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    :goto_1
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-virtual {p0, v1, p1}, Ll/cl80;->m(Ljava/lang/String;Ll/al80;)V

    .line 74
    .line 75
    .line 76
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    if-nez v1, :cond_2

    .line 81
    .line 82
    invoke-virtual {v0}, Ljava/util/PriorityQueue;->peek()Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    check-cast v1, Ll/al80;

    .line 87
    .line 88
    goto :goto_2

    .line 89
    :cond_2
    const/4 v1, 0x0

    .line 90
    :goto_2
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    move-result v2

    .line 94
    if-eqz v2, :cond_9

    .line 95
    .line 96
    invoke-virtual {v1}, Ll/al80;->m()Z

    .line 97
    .line 98
    .line 99
    move-result v2

    .line 100
    if-eqz v2, :cond_9

    .line 101
    .line 102
    if-nez p2, :cond_9

    .line 103
    .line 104
    invoke-virtual {p1}, Ll/al80;->h()I

    .line 105
    .line 106
    .line 107
    move-result p2

    .line 108
    const/4 v2, 0x1

    .line 109
    if-ne p2, v2, :cond_3

    .line 110
    .line 111
    const-string p2, "manager step remove low"

    .line 112
    .line 113
    invoke-virtual {p0, p2, p1}, Ll/cl80;->m(Ljava/lang/String;Ll/al80;)V

    .line 114
    .line 115
    .line 116
    return-void

    .line 117
    :cond_3
    invoke-virtual {p1}, Ll/al80;->g()Ll/f3m;

    .line 118
    .line 119
    .line 120
    move-result-object p2

    .line 121
    instance-of v3, p2, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;

    .line 122
    .line 123
    const-string v4, "manager step permission"

    .line 124
    .line 125
    const/4 v5, 0x5

    .line 126
    if-eqz v3, :cond_5

    .line 127
    .line 128
    check-cast p2, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;

    .line 129
    .line 130
    invoke-virtual {p2}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;->getPriority()I

    .line 131
    .line 132
    .line 133
    move-result v3

    .line 134
    if-eq v3, v5, :cond_4

    .line 135
    .line 136
    invoke-virtual {p2}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;->getPriority()I

    .line 137
    .line 138
    .line 139
    move-result v3

    .line 140
    const/4 v5, 0x3

    .line 141
    if-ne v3, v5, :cond_7

    .line 142
    .line 143
    invoke-virtual {p2}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;->getPriority()I

    .line 144
    .line 145
    .line 146
    move-result p2

    .line 147
    invoke-virtual {v1}, Ll/al80;->h()I

    .line 148
    .line 149
    .line 150
    move-result v3

    .line 151
    if-le p2, v3, :cond_7

    .line 152
    .line 153
    :cond_4
    invoke-virtual {v1}, Ll/al80;->g()Ll/f3m;

    .line 154
    .line 155
    .line 156
    move-result-object p2

    .line 157
    invoke-interface {p2, v1}, Ll/f3m;->g(Ll/al80;)V

    .line 158
    .line 159
    .line 160
    invoke-virtual {p0, p1}, Ll/cl80;->n(Ll/al80;)V

    .line 161
    .line 162
    .line 163
    invoke-virtual {p0, v4, p1}, Ll/cl80;->m(Ljava/lang/String;Ll/al80;)V

    .line 164
    .line 165
    .line 166
    return-void

    .line 167
    :cond_5
    instance-of v3, p2, Ll/g3m;

    .line 168
    .line 169
    if-eqz v3, :cond_7

    .line 170
    .line 171
    check-cast p2, Ll/g3m;

    .line 172
    .line 173
    invoke-interface {p2}, Ll/g3m;->getPriority()I

    .line 174
    .line 175
    .line 176
    move-result v3

    .line 177
    if-eq v3, v5, :cond_6

    .line 178
    .line 179
    invoke-interface {p2}, Ll/g3m;->getPriority()I

    .line 180
    .line 181
    .line 182
    move-result v3

    .line 183
    const/4 v5, 0x2

    .line 184
    if-le v3, v5, :cond_7

    .line 185
    .line 186
    invoke-interface {p2}, Ll/g3m;->getPriority()I

    .line 187
    .line 188
    .line 189
    move-result p2

    .line 190
    invoke-virtual {v1}, Ll/al80;->h()I

    .line 191
    .line 192
    .line 193
    move-result v3

    .line 194
    if-le p2, v3, :cond_7

    .line 195
    .line 196
    :cond_6
    invoke-virtual {v1}, Ll/al80;->g()Ll/f3m;

    .line 197
    .line 198
    .line 199
    move-result-object p2

    .line 200
    invoke-interface {p2, v1}, Ll/f3m;->g(Ll/al80;)V

    .line 201
    .line 202
    .line 203
    invoke-virtual {p0, p1}, Ll/cl80;->n(Ll/al80;)V

    .line 204
    .line 205
    .line 206
    invoke-virtual {p0, v4, p1}, Ll/cl80;->m(Ljava/lang/String;Ll/al80;)V

    .line 207
    .line 208
    .line 209
    return-void

    .line 210
    :cond_7
    invoke-virtual {v1}, Ll/al80;->h()I

    .line 211
    .line 212
    .line 213
    move-result p2

    .line 214
    if-ne p2, v2, :cond_8

    .line 215
    .line 216
    invoke-virtual {v1}, Ll/al80;->g()Ll/f3m;

    .line 217
    .line 218
    .line 219
    move-result-object p2

    .line 220
    invoke-interface {p2, v1}, Ll/f3m;->g(Ll/al80;)V

    .line 221
    .line 222
    .line 223
    const-string p2, "manager step dismiss low"

    .line 224
    .line 225
    invoke-virtual {p0, p2, p1}, Ll/cl80;->m(Ljava/lang/String;Ll/al80;)V

    .line 226
    .line 227
    .line 228
    invoke-virtual {p0, p1}, Ll/cl80;->n(Ll/al80;)V

    .line 229
    .line 230
    .line 231
    goto :goto_3

    .line 232
    :cond_8
    :try_start_0
    const-string p2, "manager step add list"

    .line 233
    .line 234
    invoke-virtual {p0, p2, p1}, Ll/cl80;->m(Ljava/lang/String;Ll/al80;)V

    .line 235
    .line 236
    .line 237
    invoke-virtual {v0, p1}, Ljava/util/PriorityQueue;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 238
    .line 239
    .line 240
    :catch_0
    :goto_3
    return-void

    .line 241
    :cond_9
    const-string p2, "manager step real show"

    .line 242
    .line 243
    invoke-virtual {p0, p2, p1}, Ll/cl80;->m(Ljava/lang/String;Ll/al80;)V

    .line 244
    .line 245
    .line 246
    invoke-virtual {p0, p1}, Ll/cl80;->n(Ll/al80;)V

    .line 247
    .line 248
    .line 249
    return-void
.end method

.method public s()V
    .locals 4

    .line 1
    const-string v0, "manager step show next check"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p0, v0, v1}, Ll/cl80;->m(Ljava/lang/String;Ll/al80;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/cl80;->a:Ljava/util/Map;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/cl80;->g()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ljava/util/PriorityQueue;

    .line 18
    .line 19
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-eqz v2, :cond_0

    .line 24
    .line 25
    move-object v0, v1

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    invoke-virtual {v0}, Ljava/util/PriorityQueue;->poll()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Ll/al80;

    .line 32
    .line 33
    :goto_0
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-eqz v2, :cond_1

    .line 38
    .line 39
    invoke-virtual {v0}, Ll/al80;->h()I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    const/4 v3, 0x1

    .line 44
    if-eq v2, v3, :cond_1

    .line 45
    .line 46
    const-string v2, "manager step show next"

    .line 47
    .line 48
    invoke-virtual {p0, v2, v1}, Ll/cl80;->m(Ljava/lang/String;Ll/al80;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0, v0}, Ll/cl80;->n(Ll/al80;)V

    .line 52
    .line 53
    .line 54
    :cond_1
    return-void
.end method
