.class public final Lcom/p1/mobile/putong/core/newui/supreme/SupremeListFrag;
.super Lcom/p1/mobile/putong/app/PutongMvpFrag;
.source "SourceFile"

# interfaces
.implements Ll/k6m;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/app/PutongMvpFrag<",
        "Lcom/p1/mobile/putong/core/newui/supreme/SupremeListPresenter;",
        "Lcom/p1/mobile/putong/core/newui/supreme/SupremeListViewModel;",
        ">;",
        "Ll/k6m;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u000b\u0018\u00002\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u00012\u00020\u0004B\u0007\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u000f\u0010\u0008\u001a\u00020\u0007H\u0016\u00a2\u0006\u0004\u0008\u0008\u0010\u0006J\u000f\u0010\t\u001a\u00020\u0002H\u0014\u00a2\u0006\u0004\u0008\t\u0010\nJ\u000f\u0010\u000b\u001a\u00020\u0003H\u0014\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\r\u0010\u000e\u001a\u00020\r\u00a2\u0006\u0004\u0008\u000e\u0010\u000fJ\u000f\u0010\u0010\u001a\u00020\u0007H\u0014\u00a2\u0006\u0004\u0008\u0010\u0010\u0006J\u000f\u0010\u0012\u001a\u00020\u0011H\u0016\u00a2\u0006\u0004\u0008\u0012\u0010\u0013J\u000f\u0010\u0015\u001a\u00020\u0014H\u0016\u00a2\u0006\u0004\u0008\u0015\u0010\u0016J\u001f\u0010\u0019\u001a\u00020\u00072\u0006\u0010\u0017\u001a\u00020\u00112\u0006\u0010\u0018\u001a\u00020\u0014H\u0016\u00a2\u0006\u0004\u0008\u0019\u0010\u001aR\u001b\u0010\u001e\u001a\u00020\r8BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u001b\u0010\u001c\u001a\u0004\u0008\u001d\u0010\u000f\u00a8\u0006\u001f"
    }
    d2 = {
        "Lcom/p1/mobile/putong/core/newui/supreme/SupremeListFrag;",
        "Lcom/p1/mobile/putong/app/PutongMvpFrag;",
        "Lcom/p1/mobile/putong/core/newui/supreme/SupremeListPresenter;",
        "Lcom/p1/mobile/putong/core/newui/supreme/SupremeListViewModel;",
        "Ll/k6m;",
        "<init>",
        "()V",
        "",
        "onResume",
        "T4",
        "()Lcom/p1/mobile/putong/core/newui/supreme/SupremeListPresenter;",
        "U4",
        "()Lcom/p1/mobile/putong/core/newui/supreme/SupremeListViewModel;",
        "Lcom/p1/mobile/putong/core/newui/supreme/a;",
        "S4",
        "()Lcom/p1/mobile/putong/core/newui/supreme/a;",
        "f4",
        "",
        "disableAutoPV",
        "()Z",
        "",
        "pageId",
        "()Ljava/lang/String;",
        "hidden",
        "from",
        "z3",
        "(ZLjava/lang/String;)V",
        "B",
        "Lkotlin/Lazy;",
        "R4",
        "adapter",
        "member_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final B:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongMvpFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/q8h0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/q8h0;-><init>(Lcom/p1/mobile/putong/core/newui/supreme/SupremeListFrag;)V

    .line 7
    .line 8
    .line 9
    invoke-static {v0}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/supreme/SupremeListFrag;->B:Lkotlin/Lazy;

    .line 14
    .line 15
    return-void
.end method

.method public static O4(Lcom/p1/mobile/putong/core/newui/supreme/SupremeListFrag;Z)V
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object p1, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->A:Ll/iam;

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/core/newui/supreme/SupremeListViewModel;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/supreme/SupremeListViewModel;->A()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    const-string p1, "e_supremepartner_apply"

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/supreme/SupremeListFrag;->pageId()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {p1, v0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->J4()Ll/l4g0;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->J4()Ll/l4g0;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0}, Ll/l4g0;->k()V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public static P4(Lcom/p1/mobile/putong/core/newui/supreme/SupremeListFrag;)Lcom/p1/mobile/putong/core/newui/supreme/a;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/newui/supreme/a;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->z:Ll/ar2;

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    check-cast p0, Lcom/p1/mobile/putong/core/newui/supreme/SupremeListPresenter;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/newui/supreme/a;-><init>(Lcom/p1/mobile/putong/core/newui/supreme/SupremeListPresenter;)V

    .line 11
    .line 12
    .line 13
    return-object v0
.end method

.method public static Q4(Lcom/p1/mobile/putong/core/newui/supreme/SupremeListFrag;)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/core/newui/supreme/SupremeCustomAct;->Companion:Lcom/p1/mobile/putong/core/newui/supreme/SupremeCustomAct$a;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    const/4 v2, 0x2

    .line 15
    const/4 v3, 0x0

    .line 16
    const/4 v4, 0x0

    .line 17
    invoke-static {v1, p0, v4, v2, v3}, Lcom/p1/mobile/putong/core/newui/supreme/SupremeCustomAct$a;->c(Lcom/p1/mobile/putong/core/newui/supreme/SupremeCustomAct$a;Lcom/p1/mobile/android/app/Act;IILjava/lang/Object;)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public bridge synthetic M4()Ll/ar2;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/supreme/SupremeListFrag;->T4()Lcom/p1/mobile/putong/core/newui/supreme/SupremeListPresenter;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic N4()Ll/iam;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/supreme/SupremeListFrag;->U4()Lcom/p1/mobile/putong/core/newui/supreme/SupremeListViewModel;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final R4()Lcom/p1/mobile/putong/core/newui/supreme/a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/supreme/SupremeListFrag;->B:Lkotlin/Lazy;

    .line 2
    .line 3
    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/newui/supreme/a;

    .line 8
    .line 9
    return-object p0
.end method

.method public final S4()Lcom/p1/mobile/putong/core/newui/supreme/a;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/supreme/SupremeListFrag;->R4()Lcom/p1/mobile/putong/core/newui/supreme/a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public T4()Lcom/p1/mobile/putong/core/newui/supreme/SupremeListPresenter;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/newui/supreme/SupremeListPresenter;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/newui/supreme/SupremeListPresenter;-><init>(Lcom/p1/mobile/putong/core/newui/supreme/SupremeListFrag;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public U4()Lcom/p1/mobile/putong/core/newui/supreme/SupremeListViewModel;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/newui/supreme/SupremeListViewModel;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/newui/supreme/SupremeListViewModel;-><init>(Lcom/p1/mobile/putong/core/newui/supreme/SupremeListFrag;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public disableAutoPV()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public f4()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongMvpFrag;->f4()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->z:Ll/ar2;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/putong/core/newui/supreme/SupremeListPresenter;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/supreme/SupremeListPresenter;->a0()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->L4()Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/r8h0;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/r8h0;-><init>(Lcom/p1/mobile/putong/core/newui/supreme/SupremeListFrag;)V

    .line 18
    .line 19
    .line 20
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public onResume()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Frag;->onResume()V

    .line 2
    .line 3
    .line 4
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f2:Ll/y6b;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/y6b;->G3()Lrx/c;

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    const-string p0, "p_custom_page"

    .line 2
    .line 3
    return-object p0
.end method

.method public z3(ZLjava/lang/String;)V
    .locals 0
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 7
    .line 8
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->f2:Ll/y6b;

    .line 9
    .line 10
    invoke-virtual {p2}, Ll/y6b;->I3()Z

    .line 11
    .line 12
    .line 13
    move-result p2

    .line 14
    if-eqz p2, :cond_0

    .line 15
    .line 16
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 17
    .line 18
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->f2:Ll/y6b;

    .line 19
    .line 20
    invoke-virtual {p2}, Ll/y6b;->r3()V

    .line 21
    .line 22
    .line 23
    new-instance p2, Ll/p8h0;

    .line 24
    .line 25
    invoke-direct {p2, p0}, Ll/p8h0;-><init>(Lcom/p1/mobile/putong/core/newui/supreme/SupremeListFrag;)V

    .line 26
    .line 27
    .line 28
    invoke-static {p2}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 29
    .line 30
    .line 31
    :cond_0
    if-nez p1, :cond_1

    .line 32
    .line 33
    iget-object p1, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->z:Ll/ar2;

    .line 34
    .line 35
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_1

    .line 40
    .line 41
    iget-object p1, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->A:Ll/iam;

    .line 42
    .line 43
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-eqz p1, :cond_1

    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->z:Ll/ar2;

    .line 50
    .line 51
    check-cast p0, Lcom/p1/mobile/putong/core/newui/supreme/SupremeListPresenter;

    .line 52
    .line 53
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/supreme/SupremeListPresenter;->r0()V

    .line 54
    .line 55
    .line 56
    :cond_1
    return-void
.end method
