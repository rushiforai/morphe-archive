.class public Ll/d3a;
.super Ll/nx2;
.source "SourceFile"


# instance fields
.field public b:Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleCardStack;

.field public c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/f59;",
            ">;"
        }
    .end annotation
.end field

.field public d:Ll/r2a;

.field public e:Lcom/p1/mobile/android/app/Act;

.field public f:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/r2a;Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleCardStack;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/nx2;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Ll/d3a;->f:Z

    .line 6
    .line 7
    iput-object p2, p0, Ll/d3a;->d:Ll/r2a;

    .line 8
    .line 9
    iput-object p1, p0, Ll/d3a;->e:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    iput-object p3, p0, Ll/d3a;->b:Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleCardStack;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public d(Landroid/view/View;I)V
    .locals 4

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;

    .line 2
    .line 3
    iget-object v0, p0, Ll/d3a;->d:Ll/r2a;

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->setClickCallBack(Ll/r2a;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/d3a;->c:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    check-cast p2, Ll/f59;

    .line 15
    .line 16
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->J(Ll/f59;)V

    .line 17
    .line 18
    .line 19
    iget-boolean v0, p0, Ll/d3a;->f:Z

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    iput-boolean v1, p0, Ll/d3a;->f:Z

    .line 25
    .line 26
    const/4 v0, 0x1

    .line 27
    invoke-virtual {p2, v0}, Ll/f59;->i(Z)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/d3a;->e:Lcom/p1/mobile/android/app/Act;

    .line 31
    .line 32
    new-instance v1, Ll/c3a;

    .line 33
    .line 34
    invoke-direct {v1, p1}, Ll/c3a;-><init>(Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;)V

    .line 35
    .line 36
    .line 37
    const-wide/16 v2, 0x320

    .line 38
    .line 39
    invoke-static {v0, v1, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Ll/d3a;->d:Ll/r2a;

    .line 43
    .line 44
    invoke-interface {p0, p2}, Ll/r2a;->m0(Ll/f59;)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_0
    invoke-virtual {p2, v1}, Ll/f59;->i(Z)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public e(ILandroid/content/Context;Landroid/view/LayoutInflater;)Landroid/view/View;
    .locals 0

    .line 1
    sget p1, Ll/kec0;->J7:I

    .line 2
    .line 3
    iget-object p0, p0, Ll/d3a;->b:Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleCardStack;

    .line 4
    .line 5
    const/4 p2, 0x0

    .line 6
    invoke-virtual {p3, p1, p0, p2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public f()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d3a;->c:Ljava/util/List;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public g(I)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d3a;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public h(I)I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public i(I)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d3a;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/f59;

    .line 8
    .line 9
    iget-object p0, p0, Ll/f59;->a:Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    return-object p0
.end method

.method public l(Landroid/view/View;Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public m(Ll/txl0;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/d3a;->c:Ljava/util/List;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-interface {p1, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Ll/d3a;->c:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/d3a;->d:Ll/r2a;

    .line 16
    .line 17
    invoke-interface {p0}, Ll/r2a;->v()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public n(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/f59;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/d3a;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/nx2;->a()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
