.class public Ll/rnk;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/tnk;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/android/app/Act;

.field public b:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/rnk;->a:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic e0(Ll/rnk;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/rnk;->h0(Ll/pf60;)V

    return-void
.end method

.method public static synthetic f0(Ll/rnk;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/rnk;->g0(Landroid/os/Bundle;)V

    return-void
.end method

.method private synthetic g0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/tnk;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/tnk;->r()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic h0(Ll/pf60;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/tnk;

    .line 4
    .line 5
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v0, Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 8
    .line 9
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast p1, Ljava/util/List;

    .line 12
    .line 13
    invoke-virtual {p0, v0, p1}, Ll/tnk;->m(Lcom/p1/mobile/putong/core/data/ChatGroup;Ljava/util/List;)V

    .line 14
    .line 15
    .line 16
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
    iget-object v0, p0, Ll/rnk;->a:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sget-object v1, Lcom/p1/mobile/putong/core/ui/messages/group/GroupSettingManagerAct;->f:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, Ll/rnk;->b:Ljava/lang/String;

    .line 17
    .line 18
    return-void
.end method

.method public a0()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/onk;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/onk;-><init>(Ll/rnk;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 15
    .line 16
    iget-object v1, p0, Ll/rnk;->b:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/e;->o6(Ljava/lang/String;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 23
    .line 24
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 25
    .line 26
    iget-object v2, p0, Ll/rnk;->b:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/api/e;->W6(Ljava/lang/String;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    new-instance v2, Ll/pnk;

    .line 33
    .line 34
    invoke-direct {v2}, Ll/pnk;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-static {v0, v1, v2}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    new-instance v1, Ll/qnk;

    .line 46
    .line 47
    invoke-direct {v1, p0}, Ll/qnk;-><init>(Ll/rnk;)V

    .line 48
    .line 49
    .line 50
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method
