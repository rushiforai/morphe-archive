.class public Ll/tcm;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/edm;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/core/ui/messages/question/IceBreakingQuestionEditAct;


# direct methods
.method public constructor <init>(Ll/ner;Lcom/p1/mobile/putong/core/ui/messages/question/IceBreakingQuestionEditAct;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/tcm;->a:Lcom/p1/mobile/putong/core/ui/messages/question/IceBreakingQuestionEditAct;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic e0(Ll/tcm;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/tcm;->m0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic f0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const-string p0, "\u4fdd\u5b58\u5931\u8d25"

    .line 2
    .line 3
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic g0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic h0(Ll/tcm;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/tcm;->q0()V

    return-void
.end method

.method public static synthetic i0(Ll/tcm;Lcom/p1/mobile/putong/core/data/ChatProfile;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tcm;->o0(Lcom/p1/mobile/putong/core/data/ChatProfile;)V

    return-void
.end method

.method public static synthetic j0(Ll/tcm;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tcm;->r0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic k0(Ll/tcm;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tcm;->p0(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic l0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method private m0(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/edm;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/edm;->r()V

    .line 6
    .line 7
    .line 8
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/g;->Zn()Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    new-instance v0, Ll/ncm;

    .line 21
    .line 22
    invoke-direct {v0, p0}, Ll/ncm;-><init>(Ll/tcm;)V

    .line 23
    .line 24
    .line 25
    new-instance v1, Ll/ocm;

    .line 26
    .line 27
    invoke-direct {v1}, Ll/ocm;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 35
    .line 36
    .line 37
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 38
    .line 39
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 40
    .line 41
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/g;->Yp()Lrx/subjects/a;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    new-instance v0, Ll/pcm;

    .line 50
    .line 51
    invoke-direct {v0, p0}, Ll/pcm;-><init>(Ll/tcm;)V

    .line 52
    .line 53
    .line 54
    new-instance p0, Ll/qcm;

    .line 55
    .line 56
    invoke-direct {p0}, Ll/qcm;-><init>()V

    .line 57
    .line 58
    .line 59
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 64
    .line 65
    .line 66
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 67
    .line 68
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 69
    .line 70
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/g;->fp()V

    .line 71
    .line 72
    .line 73
    return-void
.end method


# virtual methods
.method public a0()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/lcm;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/lcm;-><init>(Ll/tcm;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public n0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/edm;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/edm;->x()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object v1, p0, Ll/tcm;->a:Lcom/p1/mobile/putong/core/ui/messages/question/IceBreakingQuestionEditAct;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/question/IceBreakingQuestionEditAct;->b2()V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    new-instance v0, Ll/mcm;

    .line 18
    .line 19
    invoke-direct {v0, p0}, Ll/mcm;-><init>(Ll/tcm;)V

    .line 20
    .line 21
    .line 22
    invoke-static {v1, v0}, Ll/tcz;->B(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final synthetic o0(Lcom/p1/mobile/putong/core/data/ChatProfile;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/edm;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ChatProfile;->iceBreakingQuestions:Ljava/util/List;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/edm;->N(Ljava/util/List;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic p0(Ljava/util/List;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/edm;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/edm;->M(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic q0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tcm;->a:Lcom/p1/mobile/putong/core/ui/messages/question/IceBreakingQuestionEditAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/question/IceBreakingQuestionEditAct;->b2()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic r0(Ll/uxj0;)V
    .locals 0

    .line 1
    const-string p1, "\u4fdd\u5b58\u6210\u529f"

    .line 2
    .line 3
    invoke-static {p1}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/tcm;->a:Lcom/p1/mobile/putong/core/ui/messages/question/IceBreakingQuestionEditAct;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/question/IceBreakingQuestionEditAct;->b2()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public s0()Z
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/edm;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/edm;->w()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/api/g;->yo(Ljava/util/List;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    new-instance v2, Ll/rcm;

    .line 18
    .line 19
    invoke-direct {v2, p0}, Ll/rcm;-><init>(Ll/tcm;)V

    .line 20
    .line 21
    .line 22
    new-instance v3, Ll/scm;

    .line 23
    .line 24
    invoke-direct {v3}, Ll/scm;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-static {v2, v3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {v1, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Ll/tcm;->a:Lcom/p1/mobile/putong/core/ui/messages/question/IceBreakingQuestionEditAct;

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/question/IceBreakingQuestionEditAct;->pageId()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-static {p0, v0}, Ll/fv4;->c(Ljava/lang/String;Ljava/util/List;)V

    .line 41
    .line 42
    .line 43
    const/4 p0, 0x1

    .line 44
    return p0
.end method
