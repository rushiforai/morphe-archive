.class public final Lcom/p1/mobile/putong/core/ui/intloperation/campingactivity/IntlCampingAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/intloperation/campingactivity/IntlCampingAct$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000N\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\n\u0018\u0000 (2\u00020\u0001:\u0001)B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0019\u0010\u0007\u001a\u00020\u00062\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u0004H\u0016\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u000f\u0010\t\u001a\u00020\u0006H\u0014\u00a2\u0006\u0004\u0008\t\u0010\u0003J!\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u000b\u001a\u00020\n2\u0008\u0010\r\u001a\u0004\u0018\u00010\u000cH\u0014\u00a2\u0006\u0004\u0008\u000f\u0010\u0010J\u0011\u0010\u0012\u001a\u0004\u0018\u00010\u0011H\u0016\u00a2\u0006\u0004\u0008\u0012\u0010\u0013J\u000f\u0010\u0015\u001a\u00020\u0014H\u0016\u00a2\u0006\u0004\u0008\u0015\u0010\u0016J\u000f\u0010\u0017\u001a\u00020\u0014H\u0016\u00a2\u0006\u0004\u0008\u0017\u0010\u0016R\"\u0010\u001f\u001a\u00020\u00188\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008\u0019\u0010\u001a\u001a\u0004\u0008\u001b\u0010\u001c\"\u0004\u0008\u001d\u0010\u001eR\"\u0010\'\u001a\u00020 8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008!\u0010\"\u001a\u0004\u0008#\u0010$\"\u0004\u0008%\u0010&\u00a8\u0006*"
    }
    d2 = {
        "Lcom/p1/mobile/putong/core/ui/intloperation/campingactivity/IntlCampingAct;",
        "Lcom/p1/mobile/putong/app/PutongAct;",
        "<init>",
        "()V",
        "Landroid/os/Bundle;",
        "sis",
        "",
        "preCreateView",
        "(Landroid/os/Bundle;)V",
        "initDataOnCreate",
        "Landroid/view/LayoutInflater;",
        "inflater",
        "Landroid/view/ViewGroup;",
        "parent",
        "Landroid/view/View;",
        "inflateView",
        "(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;",
        "Landroid/animation/Animator;",
        "exitAnimation",
        "()Landroid/animation/Animator;",
        "",
        "isAnonymousMode",
        "()Z",
        "shouldSwitchToTransparentStatus",
        "Ll/x5n;",
        "c",
        "Ll/x5n;",
        "X1",
        "()Ll/x5n;",
        "Z1",
        "(Ll/x5n;)V",
        "presenter",
        "Ll/f6n;",
        "d",
        "Ll/f6n;",
        "Y1",
        "()Ll/f6n;",
        "a2",
        "(Ll/f6n;)V",
        "viewModel",
        "Companion",
        "a",
        "b_core_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final Companion:Lcom/p1/mobile/putong/core/ui/intloperation/campingactivity/IntlCampingAct$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public c:Ll/x5n;

.field public d:Ll/f6n;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/p1/mobile/putong/core/ui/intloperation/campingactivity/IntlCampingAct$a;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/intloperation/campingactivity/IntlCampingAct$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/p1/mobile/putong/core/ui/intloperation/campingactivity/IntlCampingAct;->Companion:Lcom/p1/mobile/putong/core/ui/intloperation/campingactivity/IntlCampingAct$a;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final X1()Ll/x5n;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/intloperation/campingactivity/IntlCampingAct;->c:Ll/x5n;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "presenter"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final Y1()Ll/f6n;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/intloperation/campingactivity/IntlCampingAct;->d:Ll/f6n;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "viewModel"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final Z1(Ll/x5n;)V
    .locals 0
    .param p1    # Ll/x5n;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/intloperation/campingactivity/IntlCampingAct;->c:Ll/x5n;

    .line 5
    .line 6
    return-void
.end method

.method public final a2(Ll/f6n;)V
    .locals 0
    .param p1    # Ll/f6n;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/intloperation/campingactivity/IntlCampingAct;->d:Ll/f6n;

    .line 5
    .line 6
    return-void
.end method

.method public exitAnimation()Landroid/animation/Animator;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    invoke-static {p0}, Ll/gt0;->j(I)Landroid/animation/Animator;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1
    .param p1    # Landroid/view/LayoutInflater;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/view/ViewGroup;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/intloperation/campingactivity/IntlCampingAct;->Y1()Ll/f6n;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0, p1, p2}, Ll/f6n;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/intloperation/campingactivity/IntlCampingAct;->X1()Ll/x5n;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    invoke-virtual {p2}, Ll/x5n;->h0()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/intloperation/campingactivity/IntlCampingAct;->X1()Ll/x5n;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Ll/x5n;->f0()V

    .line 24
    .line 25
    .line 26
    return-object p1
.end method

.method public initDataOnCreate()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initDataOnCreate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const/16 v0, 0x500

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public isAnonymousMode()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 1
    .param p1    # Landroid/os/Bundle;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->preCreateView(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    const-string v0, "result_data"

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, Lcom/p1/mobile/putong/core/data/IntlCampingEnvelope;

    .line 17
    .line 18
    new-instance v0, Ll/x5n;

    .line 19
    .line 20
    invoke-direct {v0, p0}, Ll/x5n;-><init>(Ll/ner;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/intloperation/campingactivity/IntlCampingAct;->Z1(Ll/x5n;)V

    .line 24
    .line 25
    .line 26
    new-instance v0, Ll/f6n;

    .line 27
    .line 28
    invoke-direct {v0, p0, p1}, Ll/f6n;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/IntlCampingEnvelope;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/intloperation/campingactivity/IntlCampingAct;->a2(Ll/f6n;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/intloperation/campingactivity/IntlCampingAct;->X1()Ll/x5n;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/intloperation/campingactivity/IntlCampingAct;->Y1()Ll/f6n;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p1, p0}, Ll/ar2;->C(Ll/iam;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public shouldSwitchToTransparentStatus()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method
