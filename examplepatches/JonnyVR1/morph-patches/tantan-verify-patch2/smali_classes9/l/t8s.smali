.class public Ll/t8s;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/dum;

.field public b:Z

.field public c:Z

.field public d:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ll/jwl;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/t8s;->b:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Ll/t8s;->c:Z

    .line 8
    .line 9
    new-instance v0, Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Ll/t8s;->d:Ljava/util/ArrayList;

    .line 15
    .line 16
    iput-object p1, p0, Ll/t8s;->a:Ll/dum;

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic a(Ll/t8s;Ll/jwl;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/t8s;->i(Ll/jwl;Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic b([Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;Ll/jwl;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p1}, Ll/jwl;->getType()Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static synthetic c(Ll/t8s;Ll/jwl;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/t8s;->h(Ll/jwl;Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;Ll/jwl;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-interface {p1}, Ll/jwl;->getType()Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 2
    .line 3
    .line 4
    move-result-object p1

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

.method public static synthetic e(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;Ll/jwl;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-interface {p1}, Ll/jwl;->getType()Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 2
    .line 3
    .line 4
    move-result-object p1

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
.method public f(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;)Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/t8s;->d:Ljava/util/ArrayList;

    .line 2
    .line 3
    new-instance v0, Ll/o8s;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Ll/o8s;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ll/jwl;

    .line 13
    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    return p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0
.end method

.method public g()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/t8s;->c:Z

    .line 2
    .line 3
    return p0
.end method

.method public final synthetic h(Ll/jwl;Landroid/content/DialogInterface;)V
    .locals 2

    .line 1
    iget-object p2, p0, Ll/t8s;->a:Ll/dum;

    .line 2
    .line 3
    iget-object p2, p2, Ll/dum;->l:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 4
    .line 5
    iget-object p2, p2, Lcom/tantan/live/eventbus/LiveEventBus;->DialogCenterEvent:Lcom/tantan/live/eventbus/LiveEventBus$DialogCenterEvent;

    .line 6
    .line 7
    invoke-virtual {p2}, Lcom/tantan/live/eventbus/LiveEventBus$DialogCenterEvent;->changeVisibility()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    new-instance v0, Ll/h1e;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/h1e;-><init>()V

    .line 14
    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    invoke-virtual {v0, v1}, Ll/h1e;->c(Z)Ll/h1e;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-interface {p1}, Ll/jwl;->getType()Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Ll/h1e;->b(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;)Ll/h1e;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-interface {p1}, Ll/jwl;->b()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    invoke-virtual {v0, v1}, Ll/h1e;->a(I)Ll/h1e;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {p2, v0}, Ll/v3f$d;->m(Ljava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Ll/t8s;->d:Ljava/util/ArrayList;

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public final synthetic i(Ll/jwl;Landroid/content/DialogInterface;)V
    .locals 2

    .line 1
    iget-object p2, p0, Ll/t8s;->a:Ll/dum;

    .line 2
    .line 3
    iget-object p2, p2, Ll/dum;->l:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 4
    .line 5
    iget-object p2, p2, Lcom/tantan/live/eventbus/LiveEventBus;->DialogCenterEvent:Lcom/tantan/live/eventbus/LiveEventBus$DialogCenterEvent;

    .line 6
    .line 7
    invoke-virtual {p2}, Lcom/tantan/live/eventbus/LiveEventBus$DialogCenterEvent;->changeVisibility()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    new-instance v0, Ll/h1e;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/h1e;-><init>()V

    .line 14
    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-virtual {v0, v1}, Ll/h1e;->c(Z)Ll/h1e;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-interface {p1}, Ll/jwl;->getType()Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Ll/h1e;->b(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;)Ll/h1e;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-interface {p1}, Ll/jwl;->b()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    invoke-virtual {v0, v1}, Ll/h1e;->a(I)Ll/h1e;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {p2, v0}, Ll/v3f$d;->m(Ljava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Ll/t8s;->d:Ljava/util/ArrayList;

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public j(Ll/jwl;)V
    .locals 1

    .line 1
    new-instance v0, Ll/r8s;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/r8s;-><init>(Ll/t8s;Ll/jwl;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1, v0}, Ll/jwl;->c(Landroid/content/DialogInterface$OnShowListener;)V

    .line 7
    .line 8
    .line 9
    new-instance v0, Ll/s8s;

    .line 10
    .line 11
    invoke-direct {v0, p0, p1}, Ll/s8s;-><init>(Ll/t8s;Ll/jwl;)V

    .line 12
    .line 13
    .line 14
    invoke-interface {p1, v0}, Ll/jwl;->a(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public k(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/t8s;->c:Z

    .line 2
    .line 3
    return-void
.end method

.method public varargs l([Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/t8s;->d:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    iget-object p0, p0, Ll/t8s;->d:Ljava/util/ArrayList;

    .line 12
    .line 13
    new-instance v0, Ll/p8s;

    .line 14
    .line 15
    invoke-direct {v0, p1}, Ll/p8s;-><init>([Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;)V

    .line 16
    .line 17
    .line 18
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    if-eqz p0, :cond_1

    .line 23
    .line 24
    const/4 p0, 0x1

    .line 25
    return p0

    .line 26
    :cond_1
    return v1
.end method

.method public m(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;)Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/t8s;->d:Ljava/util/ArrayList;

    .line 2
    .line 3
    new-instance v0, Ll/q8s;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Ll/q8s;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ll/jwl;

    .line 13
    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    invoke-interface {p0}, Ll/jwl;->dismiss()V

    .line 17
    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method
