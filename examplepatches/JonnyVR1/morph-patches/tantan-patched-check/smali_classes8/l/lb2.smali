.class public abstract Ll/lb2;
.super Ll/cf60;
.source "SourceFile"


# instance fields
.field public a:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field public b:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field public c:Landroid/view/ViewGroup;

.field public d:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/cf60;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/lb2;->a:Lrx/subjects/b;

    .line 9
    .line 10
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Ll/lb2;->b:Lrx/subjects/b;

    .line 15
    .line 16
    return-void
.end method

.method public static synthetic j(Ll/ner;Ljava/lang/Object;)Lrx/c;
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/ner;->lifecycle()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic k(Lrx/c;)Lrx/c;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic l(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Object;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-ne p1, p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method


# virtual methods
.method public final destroyItem(Landroid/view/View;ILjava/lang/Object;)V
    .locals 0

    .line 10
    invoke-super {p0, p1, p2, p3}, Ll/cf60;->destroyItem(Landroid/view/View;ILjava/lang/Object;)V

    return-void
.end method

.method public destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/lb2;->a:Lrx/subjects/b;

    .line 2
    .line 3
    invoke-virtual {v0, p3}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1, p2, p3}, Ll/lb2;->o(Landroid/view/ViewGroup;ILjava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final instantiateItem(Landroid/view/View;I)Ljava/lang/Object;
    .locals 0

    .line 22
    invoke-super {p0, p1, p2}, Ll/cf60;->instantiateItem(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final instantiateItem(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/lb2;->c:Landroid/view/ViewGroup;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/lb2;->p(Landroid/view/ViewGroup;I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iput-object p1, p0, Ll/lb2;->d:Ljava/lang/Object;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/lb2;->m(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Ll/lb2;->b:Lrx/subjects/b;

    .line 13
    .line 14
    iget-object p2, p0, Ll/lb2;->d:Ljava/lang/Object;

    .line 15
    .line 16
    invoke-virtual {p1, p2}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Ll/lb2;->d:Ljava/lang/Object;

    .line 20
    .line 21
    return-object p0
.end method

.method public m(Ljava/lang/Object;)V
    .locals 0

    .line 1
    return-void
.end method

.method public n(Ll/ner;Lrx/c;)Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/ner;",
            "Lrx/c<",
            "TV;>;)",
            "Lrx/c<",
            "TV;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/lb2;->b:Lrx/subjects/b;

    .line 7
    .line 8
    invoke-virtual {v1}, Lrx/c;->first()Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    new-instance v2, Ll/hb2;

    .line 13
    .line 14
    invoke-direct {v2, v0}, Ll/hb2;-><init>(Ljava/util/concurrent/atomic/AtomicReference;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v1, v2}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    new-instance v2, Ll/ib2;

    .line 22
    .line 23
    invoke-direct {v2, p1}, Ll/ib2;-><init>(Ll/ner;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1, v2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-static {}, Ll/psd0;->E()Lrx/c$d;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {p1, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iget-object p0, p0, Ll/lb2;->a:Lrx/subjects/b;

    .line 39
    .line 40
    new-instance v1, Ll/jb2;

    .line 41
    .line 42
    invoke-direct {v1, v0}, Ll/jb2;-><init>(Ljava/util/concurrent/atomic/AtomicReference;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p1, p0}, Lrx/c;->takeUntil(Lrx/c;)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    new-instance p1, Ll/kb2;

    .line 54
    .line 55
    invoke-direct {p1, p2}, Ll/kb2;-><init>(Lrx/c;)V

    .line 56
    .line 57
    .line 58
    const/4 p2, 0x1

    .line 59
    invoke-static {p1, p0, p2}, Ll/psd0;->D(Ll/pcj;Lrx/c;Z)Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    return-object p0
.end method

.method public abstract o(Landroid/view/ViewGroup;ILjava/lang/Object;)V
.end method

.method public abstract p(Landroid/view/ViewGroup;I)Ljava/lang/Object;
.end method
