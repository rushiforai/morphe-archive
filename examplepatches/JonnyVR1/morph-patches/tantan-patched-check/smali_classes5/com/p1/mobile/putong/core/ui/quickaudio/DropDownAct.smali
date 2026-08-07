.class public final Lcom/p1/mobile/putong/core/ui/quickaudio/DropDownAct;
.super Lcom/p1/mobile/putong/app/PutongMvpAct;
.source "SourceFile"

# interfaces
.implements Ll/w2c0;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/quickaudio/DropDownAct$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/app/PutongMvpAct<",
        "Ll/pee;",
        "Ll/mj2;",
        ">;",
        "Ll/w2c0;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000^\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\r\n\u0002\u0018\u0002\n\u0002\u0008\u0006\u0018\u0000 82\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u00012\u00020\u0004:\u00019B\u0007\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u000f\u0010\u0008\u001a\u00020\u0007H\u0016\u00a2\u0006\u0004\u0008\u0008\u0010\u0006J\u0019\u0010\u000b\u001a\u00020\u00072\u0008\u0010\n\u001a\u0004\u0018\u00010\tH\u0016\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u000f\u0010\r\u001a\u00020\u0002H\u0014\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\u000f\u0010\u000f\u001a\u00020\u0003H\u0014\u00a2\u0006\u0004\u0008\u000f\u0010\u0010J\u000f\u0010\u0012\u001a\u00020\u0011H\u0016\u00a2\u0006\u0004\u0008\u0012\u0010\u0013J\u000f\u0010\u0015\u001a\u00020\u0014H\u0016\u00a2\u0006\u0004\u0008\u0015\u0010\u0016J\u0017\u0010\u0019\u001a\n \u0018*\u0004\u0018\u00010\u00170\u0017H\u0016\u00a2\u0006\u0004\u0008\u0019\u0010\u001aJ\u0017\u0010\u001b\u001a\n \u0018*\u0004\u0018\u00010\u00170\u0017H\u0016\u00a2\u0006\u0004\u0008\u001b\u0010\u001aJ\u000f\u0010\u001c\u001a\u00020\u0007H\u0016\u00a2\u0006\u0004\u0008\u001c\u0010\u0006J\u000f\u0010\u001e\u001a\u00020\u001dH\u0016\u00a2\u0006\u0004\u0008\u001e\u0010\u001fJ\u000f\u0010 \u001a\u00020\u0007H\u0016\u00a2\u0006\u0004\u0008 \u0010\u0006J\u000f\u0010!\u001a\u00020\u0007H\u0016\u00a2\u0006\u0004\u0008!\u0010\u0006J\u000f\u0010\"\u001a\u00020\u0007H\u0014\u00a2\u0006\u0004\u0008\"\u0010\u0006J)\u0010(\u001a\u00020\u00072\u0006\u0010$\u001a\u00020#2\u0006\u0010%\u001a\u00020#2\u0008\u0010\'\u001a\u0004\u0018\u00010&H\u0014\u00a2\u0006\u0004\u0008(\u0010)J\u000f\u0010*\u001a\u00020\u0007H\u0014\u00a2\u0006\u0004\u0008*\u0010\u0006J\r\u0010+\u001a\u00020\u0007\u00a2\u0006\u0004\u0008+\u0010\u0006J\r\u0010,\u001a\u00020\u0007\u00a2\u0006\u0004\u0008,\u0010\u0006J\r\u0010-\u001a\u00020\u0014\u00a2\u0006\u0004\u0008-\u0010\u0016J\r\u0010.\u001a\u00020\u0014\u00a2\u0006\u0004\u0008.\u0010\u0016J\r\u0010/\u001a\u00020\u0014\u00a2\u0006\u0004\u0008/\u0010\u0016J\r\u00100\u001a\u00020\u0014\u00a2\u0006\u0004\u00080\u0010\u0016J\r\u00101\u001a\u00020\u0014\u00a2\u0006\u0004\u00081\u0010\u0016J\r\u00102\u001a\u00020\u0014\u00a2\u0006\u0004\u00082\u0010\u0016J\r\u00103\u001a\u00020\u0014\u00a2\u0006\u0004\u00083\u0010\u0016R\u0018\u00107\u001a\u0004\u0018\u0001048\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u00085\u00106\u00a8\u0006:"
    }
    d2 = {
        "Lcom/p1/mobile/putong/core/ui/quickaudio/DropDownAct;",
        "Lcom/p1/mobile/putong/app/PutongMvpAct;",
        "Ll/pee;",
        "Ll/mj2;",
        "Ll/w2c0;",
        "<init>",
        "()V",
        "",
        "setTransparentStatusBar",
        "Landroid/os/Bundle;",
        "sis",
        "preCreateView",
        "(Landroid/os/Bundle;)V",
        "e2",
        "()Ll/pee;",
        "g2",
        "()Ll/mj2;",
        "",
        "pageId",
        "()Ljava/lang/String;",
        "",
        "shouldSwitchToTransparentStatus",
        "()Z",
        "Landroid/view/View;",
        "kotlin.jvm.PlatformType",
        "E",
        "()Landroid/view/View;",
        "q",
        "stop",
        "Landroid/animation/Animator;",
        "C",
        "()Landroid/animation/Animator;",
        "w",
        "onBackPressed",
        "initPageHelper",
        "",
        "requestCode",
        "resultCode",
        "Landroid/content/Intent;",
        "data",
        "onActivityResult",
        "(IILandroid/content/Intent;)V",
        "onDestroyLifecycle",
        "p2",
        "d2",
        "h2",
        "k2",
        "o2",
        "n2",
        "l2",
        "m2",
        "i2",
        "Ll/th0;",
        "e",
        "Ll/th0;",
        "continueQuickChatPartyDialog",
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
.field public static final Companion:Lcom/p1/mobile/putong/core/ui/quickaudio/DropDownAct$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public e:Ll/th0;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/p1/mobile/putong/core/ui/quickaudio/DropDownAct$a;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/quickaudio/DropDownAct$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/p1/mobile/putong/core/ui/quickaudio/DropDownAct;->Companion:Lcom/p1/mobile/putong/core/ui/quickaudio/DropDownAct$a;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongMvpAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static Z1(Lcom/p1/mobile/putong/core/ui/quickaudio/DropDownAct;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/app/PutongMvpAct;->d:Ll/iam;

    .line 2
    .line 3
    instance-of v0, p1, Ll/kfe;

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    check-cast p1, Ll/kfe;

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/kfe;->O0()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/app/PutongMvpAct;->d:Ll/iam;

    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 18
    .line 19
    .line 20
    check-cast v0, Ll/kfe;

    .line 21
    .line 22
    invoke-virtual {v0}, Ll/kfe;->f()V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 27
    .line 28
    .line 29
    check-cast v0, Ll/kfe;

    .line 30
    .line 31
    invoke-virtual {v0}, Ll/kfe;->N0()Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_1

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpAct;->d:Ll/iam;

    .line 38
    .line 39
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 40
    .line 41
    .line 42
    check-cast p0, Ll/kfe;

    .line 43
    .line 44
    invoke-virtual {p0}, Ll/kfe;->e()V

    .line 45
    .line 46
    .line 47
    :cond_1
    return-void
.end method

.method public static final a2(Landroid/content/Context;)Landroid/content/Intent;
    .locals 1
    .param p0    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/quickaudio/DropDownAct;->Companion:Lcom/p1/mobile/putong/core/ui/quickaudio/DropDownAct$a;

    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/ui/quickaudio/DropDownAct$a;->a(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method

.method public static final b2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    .locals 1
    .param p0    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/quickaudio/DropDownAct;->Companion:Lcom/p1/mobile/putong/core/ui/quickaudio/DropDownAct$a;

    invoke-virtual {v0, p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/quickaudio/DropDownAct$a;->b(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method

.method public static final c2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;)Landroid/content/Intent;
    .locals 1
    .param p0    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/lang/Boolean;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/quickaudio/DropDownAct;->Companion:Lcom/p1/mobile/putong/core/ui/quickaudio/DropDownAct$a;

    invoke-virtual {v0, p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/quickaudio/DropDownAct$a;->c(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;)Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public C()Landroid/animation/Animator;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpAct;->d:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/mj2;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/mj2;->i()Landroid/animation/AnimatorSet;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    return-object p0
.end method

.method public E()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpAct;->d:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/mj2;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/mj2;->j()Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public bridge synthetic X1()Ll/ar2;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/quickaudio/DropDownAct;->e2()Ll/pee;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic Y1()Ll/iam;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/quickaudio/DropDownAct;->g2()Ll/mj2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final d2()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/DropDownAct;->e:Ll/th0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/th0;->d()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x1

    .line 10
    if-ne v0, v1, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/DropDownAct;->e:Ll/th0;

    .line 13
    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/th0;->c()V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public e2()Ll/pee;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance v0, Ll/pee;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/pee;-><init>(Lcom/p1/mobile/putong/core/ui/quickaudio/DropDownAct;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public g2()Ll/mj2;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance v0, Ll/kfe;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/kfe;-><init>(Lcom/p1/mobile/putong/core/ui/quickaudio/DropDownAct;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public final h2()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpAct;->d:Ll/iam;

    .line 2
    .line 3
    instance-of v0, p0, Ll/kfe;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    check-cast p0, Ll/kfe;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/kfe;->G0()Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public final i2()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpAct;->d:Ll/iam;

    .line 2
    .line 3
    instance-of v0, p0, Ll/kfe;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    check-cast p0, Ll/kfe;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/kfe;->H0()Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public initPageHelper()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initPageHelper()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const-string v1, "from"

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongAct;->pageHelper:Ll/l4g0;

    .line 19
    .line 20
    const-string v1, "quickchat_from"

    .line 21
    .line 22
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    filled-new-array {v0}, [Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {p0, v0}, Ll/l4g0;->p([Ll/pf60;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public final k2()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpAct;->d:Ll/iam;

    .line 2
    .line 3
    instance-of v0, p0, Ll/kfe;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    check-cast p0, Ll/kfe;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/kfe;->J0()Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public final l2()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpAct;->d:Ll/iam;

    .line 2
    .line 3
    instance-of v0, p0, Ll/kfe;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    check-cast p0, Ll/kfe;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/kfe;->I0()Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public final m2()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpAct;->d:Ll/iam;

    .line 2
    .line 3
    instance-of v0, p0, Ll/kfe;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    check-cast p0, Ll/kfe;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/kfe;->M0()Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public final n2()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpAct;->d:Ll/iam;

    .line 2
    .line 3
    instance-of v0, p0, Ll/kfe;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    check-cast p0, Ll/kfe;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/kfe;->N0()Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public final o2()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpAct;->d:Ll/iam;

    .line 2
    .line 3
    instance-of v0, p0, Ll/kfe;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    check-cast p0, Ll/kfe;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/kfe;->O0()Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 0
    .param p3    # Landroid/content/Intent;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/p1/mobile/putong/app/PutongAct;->onActivityResult(IILandroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/spl0;->Q()Z

    .line 5
    .line 6
    .line 7
    move-result p2

    .line 8
    if-eqz p2, :cond_1

    .line 9
    .line 10
    const/16 p2, 0x777

    .line 11
    .line 12
    if-ne p2, p1, :cond_1

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/quickaudio/DropDownAct;->o2()Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-interface {p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Qf()Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-nez p1, :cond_1

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/quickaudio/DropDownAct;->p2()V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/quickaudio/DropDownAct;->p2()V

    .line 35
    .line 36
    .line 37
    :cond_1
    return-void
.end method

.method public onBackPressed()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/app/PutongMvpAct;->d:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/mj2;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/mj2;->b()Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-super {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public onDestroyLifecycle()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->onDestroyLifecycle()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/spl0;->Q()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/quickaudio/DropDownAct;->d2()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public final p2()V
    .locals 2

    .line 1
    new-instance v0, Ll/th0$a;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    const-string v1, "\u60f3\u8ddf\u5176\u4ed6\u4eba\u804a\u804a\uff1f"

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/th0$a;->s(Ljava/lang/String;)Ll/th0$a;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const-string v1, "\u7ee7\u7eed\u6781\u901f\u7ea6\u4f1a\uff0c\u8bf4\u4e0d\u5b9a\u4e0b\u4e00\u4e2a\u4eba\u5c31\u80fd\u548c\u4f60\u64e6\u51fa\u706b\u82b1"

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "\u53d6\u6d88"

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const/4 v1, 0x0

    .line 27
    invoke-virtual {v0, v1}, Ll/th0$a;->h(Z)Ll/th0$a;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v1, "\u7ee7\u7eed"

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    new-instance v1, Ll/aee;

    .line 38
    .line 39
    invoke-direct {v1, p0}, Ll/aee;-><init>(Lcom/p1/mobile/putong/core/ui/quickaudio/DropDownAct;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, v1}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0}, Ll/th0$a;->a()Ll/th0;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/DropDownAct;->e:Ll/th0;

    .line 51
    .line 52
    if-eqz v0, :cond_0

    .line 53
    .line 54
    invoke-virtual {v0}, Ll/th0;->g()V

    .line 55
    .line 56
    .line 57
    :cond_0
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    const-string p0, "p_quickchat"

    .line 2
    .line 3
    return-object p0
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 0
    .param p1    # Landroid/os/Bundle;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->setSwipeBackEnable(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public q()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpAct;->d:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/mj2;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/mj2;->m()Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public setTransparentStatusBar()V
    .locals 2

    .line 1
    const/16 v0, 0x400

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/app/PutongAct;->setLightStatusBar(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const/high16 v1, -0x80000000

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const/high16 v1, 0x4000000

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/view/Window;->clearFlags(I)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const/4 v1, 0x0

    .line 29
    invoke-virtual {v0, v1}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->setStatusBarColor(I)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_0

    .line 44
    .line 45
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 50
    .line 51
    .line 52
    const/4 v0, 0x0

    .line 53
    invoke-virtual {p0, v0}, Ll/c30;->A(F)V

    .line 54
    .line 55
    .line 56
    :cond_0
    return-void
.end method

.method public shouldSwitchToTransparentStatus()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public stop()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpAct;->d:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/mj2;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/mj2;->p()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public w()V
    .locals 0

    .line 1
    return-void
.end method
