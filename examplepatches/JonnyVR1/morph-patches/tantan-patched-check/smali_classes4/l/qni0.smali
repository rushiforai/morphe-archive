.class public Ll/qni0;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/TaskCenterAct;


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    check-cast p1, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/TaskCenterAct;

    .line 5
    .line 6
    iput-object p1, p0, Ll/qni0;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/TaskCenterAct;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic e0(Ll/qni0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qni0;->h0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic f0(Ll/qni0;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qni0;->i0(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic g0(Ll/uxj0;)V
    .locals 0

    .line 1
    return-void
.end method

.method private synthetic i0(Ljava/util/List;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a;->c(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public Z()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/ar2;->Z()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/dkb;->A7()Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Ll/nni0;

    .line 17
    .line 18
    invoke-direct {v1}, Ll/nni0;-><init>()V

    .line 19
    .line 20
    .line 21
    new-instance v2, Ll/oni0;

    .line 22
    .line 23
    invoke-direct {v2, p0}, Ll/oni0;-><init>(Ll/qni0;)V

    .line 24
    .line 25
    .line 26
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public a0()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 7
    .line 8
    iget-object v0, v0, Ll/dkb;->i7:Lrx/subjects/a;

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ll/pni0;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/pni0;-><init>(Ll/qni0;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic h0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a;

    .line 4
    .line 5
    const/4 p1, 0x1

    .line 6
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a;->e(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
