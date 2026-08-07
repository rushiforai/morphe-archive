.class public abstract Lcom/p1/mobile/putong/core/ui/greet/c;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Ll/vck;",
        ">",
        "Ll/ar2<",
        "TV;>;"
    }
.end annotation


# instance fields
.field public a:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/core/data/Greeting;",
            ">;"
        }
    .end annotation
.end field

.field public b:Ljava/lang/String;

.field public c:Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;

.field public d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/ldk;",
            ">;"
        }
    .end annotation
.end field

.field public e:Z

.field public f:Z


# direct methods
.method public constructor <init>(Ll/ner;Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/c;->a:Lrx/subjects/a;

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/greet/c;->e:Z

    .line 12
    .line 13
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/greet/c;->f:Z

    .line 14
    .line 15
    iget-object p1, p2, Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;->from:Ljava/lang/String;

    .line 16
    .line 17
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/c;->b:Ljava/lang/String;

    .line 18
    .line 19
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/greet/c;->c:Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;

    .line 20
    .line 21
    new-instance p1, Ljava/util/ArrayList;

    .line 22
    .line 23
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/c;->d:Ljava/util/List;

    .line 27
    .line 28
    return-void
.end method


# virtual methods
.method public Z()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/ar2;->Z()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/c;->d:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Ll/ldk;

    .line 21
    .line 22
    invoke-virtual {v1}, Ll/ldk;->b()V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 v0, 0x1

    .line 27
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/greet/c;->f:Z

    .line 28
    .line 29
    return-void
.end method

.method public a0()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/c;->d:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Ll/ldk;

    .line 21
    .line 22
    invoke-virtual {v1}, Ll/ldk;->c()V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 v0, 0x1

    .line 27
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/greet/c;->e:Z

    .line 28
    .line 29
    return-void
.end method

.method public final e0(Lcom/p1/mobile/putong/core/data/Greeting;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Greeting;->channel:Lcom/p1/mobile/putong/data/Channel;

    .line 2
    .line 3
    const-string v1, "unknown_"

    .line 4
    .line 5
    invoke-static {v1}, Lcom/p1/mobile/putong/data/Channel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Channel;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->f0()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {p0}, Lcom/p1/mobile/putong/data/Channel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Channel;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Greeting;->channel:Lcom/p1/mobile/putong/data/Channel;

    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public abstract f0()Ljava/lang/String;
.end method

.method public g0()Lcom/p1/mobile/putong/core/data/Greeting;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/c;->a:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/data/Greeting;

    .line 8
    .line 9
    return-object p0
.end method

.method public getFrom()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/c;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public h0()Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/c;->c:Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;

    .line 2
    .line 3
    return-object p0
.end method

.method public i0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/c;->c:Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;->greetInfo:Lcom/p1/mobile/putong/core/data/Greeting;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/greet/c;->e0(Lcom/p1/mobile/putong/core/data/Greeting;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/c;->a:Lrx/subjects/a;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/c;->c:Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;->greetInfo:Lcom/p1/mobile/putong/core/data/Greeting;

    .line 13
    .line 14
    invoke-virtual {v0, p0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public j0(Ll/ldk;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/c;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/greet/c;->f:Z

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p1}, Ll/ldk;->b()V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/greet/c;->e:Z

    .line 14
    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    invoke-virtual {p1}, Ll/ldk;->c()V

    .line 18
    .line 19
    .line 20
    :cond_1
    return-void
.end method
