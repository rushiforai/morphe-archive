.class public Ll/yde0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static d:I = 0x3


# instance fields
.field public a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/orc0;",
            ">;"
        }
    .end annotation
.end field

.field public b:Ll/pi80;

.field public c:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Ll/pi80;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/yde0;->a:Ljava/util/List;

    .line 10
    .line 11
    iput-object p1, p0, Ll/yde0;->b:Ll/pi80;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public a(Ll/orc0;Ll/dxi0;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/yde0;->a:Ljava/util/List;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-interface {v0, v1, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Ll/yde0;->a:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    sget v0, Ll/yde0;->d:I

    .line 14
    .line 15
    if-le p1, v0, :cond_0

    .line 16
    .line 17
    iget-object p1, p0, Ll/yde0;->a:Ljava/util/List;

    .line 18
    .line 19
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    add-int/lit8 p1, p1, -0x1

    .line 24
    .line 25
    :goto_0
    sget v0, Ll/yde0;->d:I

    .line 26
    .line 27
    if-lt p1, v0, :cond_0

    .line 28
    .line 29
    iget-object v0, p0, Ll/yde0;->a:Ljava/util/List;

    .line 30
    .line 31
    invoke-interface {v0, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Ll/orc0;

    .line 36
    .line 37
    iget-object v1, v0, Ll/orc0;->g:Ll/ns2;

    .line 38
    .line 39
    invoke-virtual {p2, v1}, Ll/dxi0;->w(Ll/ns2;)V

    .line 40
    .line 41
    .line 42
    iget-object v1, p0, Ll/yde0;->b:Ll/pi80;

    .line 43
    .line 44
    iget-object v2, v0, Ll/orc0;->g:Ll/ns2;

    .line 45
    .line 46
    invoke-virtual {v1, v2}, Ll/pi80;->a(Ll/ns2;)V

    .line 47
    .line 48
    .line 49
    iget-object v1, p0, Ll/yde0;->c:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;

    .line 50
    .line 51
    iget-object v2, v0, Ll/orc0;->g:Ll/ns2;

    .line 52
    .line 53
    iget-object v2, v2, Ll/ns2;->a:Landroid/view/View;

    .line 54
    .line 55
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->y(Landroid/view/View;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0}, Ll/orc0;->b()V

    .line 59
    .line 60
    .line 61
    add-int/lit8 p1, p1, -0x1

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_0
    return-void
.end method

.method public b(Ll/dxi0;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/yde0;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/yde0;->a:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    check-cast v1, Ll/orc0;

    .line 26
    .line 27
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 28
    .line 29
    .line 30
    iget-object v2, v1, Ll/orc0;->g:Ll/ns2;

    .line 31
    .line 32
    invoke-virtual {p1, v2}, Ll/dxi0;->w(Ll/ns2;)V

    .line 33
    .line 34
    .line 35
    iget-object v2, p0, Ll/yde0;->b:Ll/pi80;

    .line 36
    .line 37
    iget-object v3, v1, Ll/orc0;->g:Ll/ns2;

    .line 38
    .line 39
    invoke-virtual {v2, v3}, Ll/pi80;->a(Ll/ns2;)V

    .line 40
    .line 41
    .line 42
    iget-object v2, p0, Ll/yde0;->c:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;

    .line 43
    .line 44
    iget-object v3, v1, Ll/orc0;->g:Ll/ns2;

    .line 45
    .line 46
    iget-object v3, v3, Ll/ns2;->a:Landroid/view/View;

    .line 47
    .line 48
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->y(Landroid/view/View;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v1}, Ll/orc0;->b()V

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_0
    return-void
.end method

.method public c()Ll/orc0;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yde0;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/yde0;->a:Ljava/util/List;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-interface {p0, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Ll/orc0;

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return-object p0
.end method

.method public d(Ll/orc0;Ll/dxi0;)V
    .locals 1

    .line 1
    iget-object v0, p1, Ll/orc0;->g:Ll/ns2;

    .line 2
    .line 3
    invoke-virtual {p2, v0}, Ll/dxi0;->w(Ll/ns2;)V

    .line 4
    .line 5
    .line 6
    iget-object p2, p0, Ll/yde0;->b:Ll/pi80;

    .line 7
    .line 8
    iget-object v0, p1, Ll/orc0;->g:Ll/ns2;

    .line 9
    .line 10
    invoke-virtual {p2, v0}, Ll/pi80;->a(Ll/ns2;)V

    .line 11
    .line 12
    .line 13
    iget p2, p1, Ll/orc0;->h:I

    .line 14
    .line 15
    const/4 v0, 0x3

    .line 16
    if-ne p2, v0, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Ll/yde0;->c:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;

    .line 19
    .line 20
    iget-object p2, p1, Ll/orc0;->g:Ll/ns2;

    .line 21
    .line 22
    iget-object p2, p2, Ll/ns2;->a:Landroid/view/View;

    .line 23
    .line 24
    invoke-virtual {p0, p2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const/4 v0, 0x2

    .line 29
    if-ne p2, v0, :cond_1

    .line 30
    .line 31
    iget-object p0, p0, Ll/yde0;->c:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;

    .line 32
    .line 33
    iget-object p2, p1, Ll/orc0;->g:Ll/ns2;

    .line 34
    .line 35
    iget-object p2, p2, Ll/ns2;->a:Landroid/view/View;

    .line 36
    .line 37
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->y(Landroid/view/View;)V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    const/4 v0, 0x4

    .line 42
    if-ne p2, v0, :cond_2

    .line 43
    .line 44
    iget-object p0, p0, Ll/yde0;->c:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;

    .line 45
    .line 46
    iget-object p2, p1, Ll/orc0;->g:Ll/ns2;

    .line 47
    .line 48
    iget-object p2, p2, Ll/ns2;->a:Landroid/view/View;

    .line 49
    .line 50
    invoke-virtual {p0, p2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 51
    .line 52
    .line 53
    :cond_2
    :goto_0
    invoke-virtual {p1}, Ll/orc0;->b()V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public e(Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/yde0;->c:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;

    .line 2
    .line 3
    return-void
.end method
