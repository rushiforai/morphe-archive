.class public abstract Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;
.implements Landroid/os/Handler$Callback;


# static fields
.field public static e:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c;

.field public static f:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c;

.field public static g:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c;


# instance fields
.field public a:Landroid/view/View;

.field public b:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c;

.field public c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c;",
            ">;"
        }
    .end annotation
.end field

.field public d:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/d;->e:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c$d;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c$d;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/d;->f:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c;

    .line 14
    .line 15
    new-instance v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c$e;

    .line 16
    .line 17
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c$e;-><init>()V

    .line 18
    .line 19
    .line 20
    sput-object v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/d;->g:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c;

    .line 21
    .line 22
    return-void
.end method

.method public constructor <init>()V
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
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/d;->c:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Landroid/os/Handler;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Landroid/os/Handler;-><init>(Landroid/os/Handler$Callback;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/d;->d:Landroid/os/Handler;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public d(Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c;Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    return p0
.end method

.method public e()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/d;->a:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/d;->c:Ljava/util/List;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-lez v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/d;->a:Landroid/view/View;

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    const/4 v0, 0x0

    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/d;->b:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c;

    .line 24
    .line 25
    return-void
.end method

.method public g()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    return p0
.end method

.method public h(Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/d;->i(Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c;Ll/y20;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public handleMessage(Landroid/os/Message;)Z
    .locals 0
    .param p1    # Landroid/os/Message;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/d;->run()V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x1

    .line 5
    return p0
.end method

.method public i(Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c;Ll/y20;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c;",
            "Ll/y20<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/d;->k(Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c;)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/d;->c:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/d;->c:Ljava/util/List;

    .line 11
    .line 12
    const/4 v2, -0x1

    .line 13
    if-ne v0, v2, :cond_0

    .line 14
    .line 15
    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    invoke-interface {v1, v0, p1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/d;->a:Landroid/view/View;

    .line 23
    .line 24
    if-eqz p1, :cond_2

    .line 25
    .line 26
    if-eqz p2, :cond_1

    .line 27
    .line 28
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/d;->c:Ljava/util/List;

    .line 29
    .line 30
    invoke-interface {p2, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/d;->e()V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_2
    const-string p0, "you must call "

    .line 38
    .line 39
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public abstract j(Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c;)V
.end method

.method public final k(Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c;)I
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/d;->c:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-lez v0, :cond_1

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/d;->c:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-ge v0, v1, :cond_1

    .line 19
    .line 20
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/d;->c:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c;

    .line 27
    .line 28
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    if-ne v1, v2, :cond_0

    .line 37
    .line 38
    return v0

    .line 39
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    const/4 p0, -0x1

    .line 43
    return p0
.end method

.method public l()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/d;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public m(Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/d;->c:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-lez v0, :cond_1

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/d;->c:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c;

    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    if-ne v0, v1, :cond_0

    .line 38
    .line 39
    invoke-interface {p0}, Ljava/util/Iterator;->remove()V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    return-void
.end method

.method public n(Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/d;->a:Landroid/view/View;

    .line 2
    .line 3
    return-void
.end method

.method public run()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/d;->g()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "\u5f00\u59cb\u6267\u884c\u4efb\u52a1 "

    .line 8
    .line 9
    invoke-static {v0}, Ll/yor;->c(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/d;->c:Ljava/util/List;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-lez v0, :cond_0

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/d;->c:Ljava/util/List;

    .line 23
    .line 24
    const/4 v1, 0x0

    .line 25
    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c;

    .line 30
    .line 31
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c;->a()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/d;->b:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c;

    .line 35
    .line 36
    invoke-virtual {p0, v1, v0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/d;->d(Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c;Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c;)Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-eqz v1, :cond_0

    .line 41
    .line 42
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/d;->b:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c;

    .line 43
    .line 44
    new-instance v0, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    const-string v1, "\u5f00\u59cb\u6267\u884c "

    .line 47
    .line 48
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/d;->b:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c;

    .line 52
    .line 53
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c;->a()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-static {v0}, Ll/yor;->c(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/d;->b:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c;

    .line 68
    .line 69
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/d;->j(Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c;)V

    .line 70
    .line 71
    .line 72
    :cond_0
    return-void
.end method
