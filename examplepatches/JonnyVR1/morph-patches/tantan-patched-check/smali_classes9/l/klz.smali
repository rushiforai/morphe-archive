.class public Ll/klz;
.super Ll/tvz;
.source "SourceFile"


# instance fields
.field public p1:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public q1:Z

.field public r1:Z


# direct methods
.method public constructor <init>(Ll/ner;Lcom/p1/mobile/putong/core/data/Conversation;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/tvz;-><init>(Ll/ner;Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Ll/klz;->q1:Z

    .line 6
    .line 7
    iput-boolean p1, p0, Ll/klz;->r1:Z

    .line 8
    .line 9
    iput-object p3, p0, Ll/clz;->b:Ljava/lang/String;

    .line 10
    .line 11
    iput-object p3, p0, Ll/clz;->c:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Conversation;->new_()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iput-object p3, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 18
    .line 19
    iput-object p3, p1, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {p1}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    iput-object p2, p0, Ll/klz;->p1:Lrx/subjects/a;

    .line 26
    .line 27
    iput-object p1, p0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 28
    .line 29
    return-void
.end method


# virtual methods
.method public T2()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/klz;->p1:Lrx/subjects/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public U2()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/klz;->p1:Lrx/subjects/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public a0()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/tvz;->a0()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/clz;->i3()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/g;->De(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public a6()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public b7(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/klz;->r1:Z

    .line 2
    .line 3
    return-void
.end method

.method public c6()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/klz;->r1:Z

    .line 2
    .line 3
    return p0
.end method

.method public g3(Landroid/content/Intent;)Landroid/content/Intent;
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/klz;->q1:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {v0, p1}, Ll/r97;->K3(Landroid/content/Intent;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    invoke-super {p0, p1}, Ll/clz;->g3(Landroid/content/Intent;)Landroid/content/Intent;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public wg()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method
