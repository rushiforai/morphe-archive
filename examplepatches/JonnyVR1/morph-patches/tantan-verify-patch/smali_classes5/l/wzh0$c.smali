.class public Ll/wzh0$c;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/wzh0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "c"
.end annotation


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "TT;>;"
        }
    .end annotation
.end field

.field public c:Ljava/util/concurrent/atomic/AtomicInteger;

.field public d:Z

.field public final synthetic e:Ll/wzh0;


# direct methods
.method public constructor <init>(Ll/wzh0;Ljava/lang/String;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/wzh0$c;->e:Ll/wzh0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-direct {p1, v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Ll/wzh0$c;->c:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 13
    .line 14
    iput-boolean v0, p0, Ll/wzh0$c;->d:Z

    .line 15
    .line 16
    iput-object p2, p0, Ll/wzh0$c;->a:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iput-object p1, p0, Ll/wzh0$c;->b:Lrx/subjects/a;

    .line 23
    .line 24
    return-void
.end method

.method public static synthetic a(Ll/wzh0$c;Lcom/tantanapp/common/data/DbObject;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wzh0$c;->e(Lcom/tantanapp/common/data/DbObject;)V

    return-void
.end method

.method public static synthetic b(Ll/wzh0$c;)Lcom/tantanapp/common/data/DbObject;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/wzh0$c;->d()Lcom/tantanapp/common/data/DbObject;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic c(Ll/wzh0$c;)Lrx/subjects/a;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wzh0$c;->b:Lrx/subjects/a;

    return-object p0
.end method


# virtual methods
.method public final synthetic d()Lcom/tantanapp/common/data/DbObject;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wzh0$c;->e:Ll/wzh0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/wzh0$c;->a:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/wzh0;->query(Ljava/lang/String;)Lcom/tantanapp/common/data/DbObject;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final synthetic e(Lcom/tantanapp/common/data/DbObject;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wzh0$c;->c:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 5
    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/wzh0$c;->e:Ll/wzh0;

    .line 10
    .line 11
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, v1, p1}, Lcom/tantanapp/common/data/orm/LruCache2;->cache(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object p0, p0, Ll/wzh0$c;->b:Lrx/subjects/a;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public f()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/wzh0$c;->d:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/wzh0$c;->b:Lrx/subjects/a;

    .line 6
    .line 7
    iget-object v1, p0, Ll/wzh0$c;->e:Ll/wzh0;

    .line 8
    .line 9
    iget-object v2, p0, Ll/wzh0$c;->a:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v1, v2}, Ll/wzh0;->queryCache(Ljava/lang/String;)Lcom/tantanapp/common/data/DbObject;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    new-instance v0, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    const-string v1, "triggered get "

    .line 21
    .line 22
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Ll/wzh0$c;->a:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-static {v0}, Ll/wzh0;->n(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    const/4 v0, 0x0

    .line 38
    iput-boolean v0, p0, Ll/wzh0$c;->d:Z

    .line 39
    .line 40
    :cond_0
    return-void
.end method

.method public g(Z)V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/wzh0$c;->c:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_2

    .line 10
    .line 11
    iget-object v0, p0, Ll/wzh0$c;->e:Ll/wzh0;

    .line 12
    .line 13
    iget-object v1, p0, Ll/wzh0$c;->a:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lcom/tantanapp/common/data/orm/LruCache2;->cached(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Lcom/tantanapp/common/data/DbObject;

    .line 20
    .line 21
    const/4 v1, 0x2

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    iget-object p1, p0, Ll/wzh0$c;->c:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 25
    .line 26
    invoke-virtual {p1, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Ll/wzh0$c;->b:Lrx/subjects/a;

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    if-eqz p1, :cond_1

    .line 36
    .line 37
    sget-boolean p1, Ll/wzh0;->l:Z

    .line 38
    .line 39
    if-nez p1, :cond_1

    .line 40
    .line 41
    iget-object v2, p0, Ll/wzh0$c;->e:Ll/wzh0;

    .line 42
    .line 43
    new-instance v4, Ll/xzh0;

    .line 44
    .line 45
    invoke-direct {v4, p0}, Ll/xzh0;-><init>(Ll/wzh0$c;)V

    .line 46
    .line 47
    .line 48
    new-instance v5, Ll/yzh0;

    .line 49
    .line 50
    invoke-direct {v5, p0}, Ll/yzh0;-><init>(Ll/wzh0$c;)V

    .line 51
    .line 52
    .line 53
    new-instance p1, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    const-string v0, "uiget_"

    .line 56
    .line 57
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Ll/wzh0$c;->e:Ll/wzh0;

    .line 61
    .line 62
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    const-string v0, "_"

    .line 68
    .line 69
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    iget-object p0, p0, Ll/wzh0$c;->a:Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v8

    .line 81
    const/4 v3, 0x0

    .line 82
    const/4 v6, 0x0

    .line 83
    const/4 v7, 0x1

    .line 84
    invoke-virtual/range {v2 .. v8}, Ll/wzh0;->j(ZLl/pcj;Ll/y20;Ll/x20;ZLjava/lang/String;)V

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    :cond_1
    iget-object p1, p0, Ll/wzh0$c;->c:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 89
    .line 90
    invoke-virtual {p1, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 91
    .line 92
    .line 93
    iget-object p1, p0, Ll/wzh0$c;->b:Lrx/subjects/a;

    .line 94
    .line 95
    iget-object v0, p0, Ll/wzh0$c;->e:Ll/wzh0;

    .line 96
    .line 97
    iget-object p0, p0, Ll/wzh0$c;->a:Ljava/lang/String;

    .line 98
    .line 99
    invoke-virtual {v0, p0}, Ll/wzh0;->queryCache(Ljava/lang/String;)Lcom/tantanapp/common/data/DbObject;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    invoke-virtual {p1, p0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 104
    .line 105
    .line 106
    :cond_2
    return-void
.end method
