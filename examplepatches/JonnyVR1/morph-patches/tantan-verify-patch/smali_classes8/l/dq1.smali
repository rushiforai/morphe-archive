.class public abstract Ll/dq1;
.super Landroid/widget/BaseAdapter;
.source "SourceFile"

# interfaces
.implements Landroid/widget/AbsListView$RecyclerListener;
.implements Ll/pol;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Landroid/widget/BaseAdapter;",
        "Landroid/widget/AbsListView$RecyclerListener;",
        "Ll/pol;"
    }
.end annotation


# instance fields
.field public a:Landroid/view/View;

.field public b:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/dq1;->a:Landroid/view/View;

    .line 6
    .line 7
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Ll/dq1;->b:Lrx/subjects/b;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic b(Landroid/view/View;Landroid/view/View;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-ne p1, p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static synthetic d(Lrx/c;)Lrx/c;
    .locals 0

    .line 1
    return-object p0
.end method


# virtual methods
.method public c(Ll/ner;Lrx/c;)Lrx/c;
    .locals 1
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
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Ll/dq1;->g(Ll/ner;Lrx/c;Z)Lrx/c;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public e(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public g(Ll/ner;Lrx/c;Z)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/ner;",
            "Lrx/c<",
            "TV;>;Z)",
            "Lrx/c<",
            "TV;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/dq1;->a:Landroid/view/View;

    .line 2
    .line 3
    invoke-interface {p1}, Ll/ner;->lifecycle()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {}, Ll/psd0;->E()Lrx/c$d;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {p1, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object p0, p0, Ll/dq1;->b:Lrx/subjects/b;

    .line 16
    .line 17
    new-instance v1, Ll/bq1;

    .line 18
    .line 19
    invoke-direct {v1, v0}, Ll/bq1;-><init>(Landroid/view/View;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p1, p0}, Lrx/c;->takeUntil(Lrx/c;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    new-instance p1, Ll/cq1;

    .line 31
    .line 32
    invoke-direct {p1, p2}, Ll/cq1;-><init>(Lrx/c;)V

    .line 33
    .line 34
    .line 35
    invoke-static {p1, p0, p3}, Ll/psd0;->D(Ll/pcj;Lrx/c;Z)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Landroid/widget/BaseAdapter;->getItemViewType(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez p2, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p3, v0}, Ll/dq1;->m(Landroid/view/ViewGroup;I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    :cond_0
    iput-object p2, p0, Ll/dq1;->a:Landroid/view/View;

    .line 12
    .line 13
    invoke-interface {p0, p1}, Landroid/widget/Adapter;->getItem(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p3

    .line 17
    invoke-virtual {p0, p2, p3, v0, p1}, Ll/dq1;->j(Landroid/view/View;Ljava/lang/Object;II)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, p1}, Ll/dq1;->e(I)V

    .line 21
    .line 22
    .line 23
    return-object p2
.end method

.method public abstract j(Landroid/view/View;Ljava/lang/Object;II)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "TT;II)V"
        }
    .end annotation
.end method

.method public abstract m(Landroid/view/ViewGroup;I)Landroid/view/View;
.end method

.method public onMovedToScrapHeap(Landroid/view/View;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/dq1;->b:Lrx/subjects/b;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
