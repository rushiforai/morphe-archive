.class public final Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListFrag;
.super Lcom/p1/mobile/putong/app/PutongMvpFrag;
.source "SourceFile"

# interfaces
.implements Ll/k6m;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/app/PutongMvpFrag<",
        "Ll/b090;",
        "Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;",
        ">;",
        "Ll/k6m;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0011\u0018\u00002\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u00012\u00020\u0004B\u0007\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u000f\u0010\u0007\u001a\u00020\u0002H\u0014\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u000f\u0010\t\u001a\u00020\u0003H\u0014\u00a2\u0006\u0004\u0008\t\u0010\nJ\r\u0010\u000c\u001a\u00020\u000b\u00a2\u0006\u0004\u0008\u000c\u0010\rJ\u000f\u0010\u000f\u001a\u00020\u000eH\u0014\u00a2\u0006\u0004\u0008\u000f\u0010\u0006J\u000f\u0010\u0011\u001a\u00020\u0010H\u0016\u00a2\u0006\u0004\u0008\u0011\u0010\u0012J\u000f\u0010\u0014\u001a\u00020\u0013H\u0016\u00a2\u0006\u0004\u0008\u0014\u0010\u0015J\r\u0010\u0016\u001a\u00020\u000e\u00a2\u0006\u0004\u0008\u0016\u0010\u0006J\u001f\u0010\u0019\u001a\u00020\u000e2\u0006\u0010\u0017\u001a\u00020\u00102\u0006\u0010\u0018\u001a\u00020\u0013H\u0016\u00a2\u0006\u0004\u0008\u0019\u0010\u001aR\u0016\u0010\u001d\u001a\u00020\u00108\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u001b\u0010\u001cR\u0016\u0010\u001f\u001a\u00020\u00108\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u001e\u0010\u001cR\u001b\u0010#\u001a\u00020\u000b8BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008 \u0010!\u001a\u0004\u0008\"\u0010\r\u00a8\u0006$"
    }
    d2 = {
        "Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListFrag;",
        "Lcom/p1/mobile/putong/app/PutongMvpFrag;",
        "Ll/b090;",
        "Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;",
        "Ll/k6m;",
        "<init>",
        "()V",
        "V4",
        "()Ll/b090;",
        "W4",
        "()Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;",
        "Lcom/p1/mobile/putong/core/newui/customized/result/a;",
        "U4",
        "()Lcom/p1/mobile/putong/core/newui/customized/result/a;",
        "",
        "f4",
        "",
        "disableAutoPV",
        "()Z",
        "",
        "pageId",
        "()Ljava/lang/String;",
        "S4",
        "hidden",
        "from",
        "z3",
        "(ZLjava/lang/String;)V",
        "B",
        "Z",
        "isHidden",
        "C",
        "needHasPrivilegeAutoEnterCustomized",
        "D",
        "Lkotlin/Lazy;",
        "T4",
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
.field public B:Z

.field public C:Z

.field public final D:Lkotlin/Lazy;
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
    new-instance v0, Ll/gz80;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/gz80;-><init>(Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListFrag;)V

    .line 7
    .line 8
    .line 9
    invoke-static {v0}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListFrag;->D:Lkotlin/Lazy;

    .line 14
    .line 15
    return-void
.end method

.method public static O4(Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListFrag;)Lcom/p1/mobile/putong/core/newui/customized/result/a;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/newui/customized/result/a;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->z:Ll/ar2;

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    check-cast p0, Ll/b090;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/newui/customized/result/a;-><init>(Ll/b090;)V

    .line 11
    .line 12
    .line 13
    return-object v0
.end method

.method public static P4(Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListFrag;)V
    .locals 3

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
    invoke-virtual {v1, p0, v2}, Lcom/p1/mobile/putong/core/newui/supreme/SupremeCustomAct$a;->b(Lcom/p1/mobile/android/app/Act;I)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static Q4(Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListFrag;Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->J4()Ll/l4g0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->J4()Ll/l4g0;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/l4g0;->k()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static R4(Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListFrag;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/newui/supreme/SupremeCustomAct;->Companion:Lcom/p1/mobile/putong/core/newui/supreme/SupremeCustomAct$a;

    .line 8
    .line 9
    const/4 v1, 0x2

    .line 10
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/putong/core/newui/supreme/SupremeCustomAct$a;->b(Lcom/p1/mobile/android/app/Act;I)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method


# virtual methods
.method public bridge synthetic M4()Ll/ar2;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListFrag;->V4()Ll/b090;

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListFrag;->W4()Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final S4()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListFrag;->B:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListFrag;->C:Z

    .line 7
    .line 8
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->y2:Ll/yna;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/yna;->Z3()V

    .line 13
    .line 14
    .line 15
    new-instance v0, Ll/hz80;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Ll/hz80;-><init>(Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListFrag;)V

    .line 18
    .line 19
    .line 20
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    const/4 v0, 0x1

    .line 25
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListFrag;->C:Z

    .line 26
    .line 27
    return-void
.end method

.method public final T4()Lcom/p1/mobile/putong/core/newui/customized/result/a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListFrag;->D:Lkotlin/Lazy;

    .line 2
    .line 3
    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/newui/customized/result/a;

    .line 8
    .line 9
    return-object p0
.end method

.method public final U4()Lcom/p1/mobile/putong/core/newui/customized/result/a;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListFrag;->T4()Lcom/p1/mobile/putong/core/newui/customized/result/a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public V4()Ll/b090;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance v0, Ll/b090;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/b090;-><init>(Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListFrag;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public W4()Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;-><init>(Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListFrag;)V

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->L4()Lrx/c;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    new-instance v1, Ll/fz80;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Ll/fz80;-><init>(Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListFrag;)V

    .line 11
    .line 12
    .line 13
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    const-string p0, "p_personalized_page"

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
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListFrag;->B:Z

    .line 5
    .line 6
    if-nez p1, :cond_2

    .line 7
    .line 8
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->y2:Ll/yna;

    .line 11
    .line 12
    invoke-virtual {p2}, Ll/yna;->R3()Z

    .line 13
    .line 14
    .line 15
    move-result p2

    .line 16
    if-eqz p2, :cond_1

    .line 17
    .line 18
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 19
    .line 20
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->y2:Ll/yna;

    .line 21
    .line 22
    invoke-virtual {p2}, Ll/yna;->Y3()V

    .line 23
    .line 24
    .line 25
    invoke-static {}, Ll/joa;->J3()Z

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    if-eqz p2, :cond_0

    .line 30
    .line 31
    const/4 p2, 0x0

    .line 32
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListFrag;->C:Z

    .line 33
    .line 34
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 35
    .line 36
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->y2:Ll/yna;

    .line 37
    .line 38
    invoke-virtual {p2}, Ll/yna;->Z3()V

    .line 39
    .line 40
    .line 41
    :cond_0
    new-instance p2, Ll/ez80;

    .line 42
    .line 43
    invoke-direct {p2, p0}, Ll/ez80;-><init>(Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListFrag;)V

    .line 44
    .line 45
    .line 46
    invoke-static {p2}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    iget-boolean p2, p0, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListFrag;->C:Z

    .line 51
    .line 52
    if-eqz p2, :cond_2

    .line 53
    .line 54
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListFrag;->S4()V

    .line 55
    .line 56
    .line 57
    :cond_2
    :goto_0
    if-nez p1, :cond_3

    .line 58
    .line 59
    iget-object p1, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->z:Ll/ar2;

    .line 60
    .line 61
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    if-eqz p1, :cond_3

    .line 66
    .line 67
    iget-object p1, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->A:Ll/iam;

    .line 68
    .line 69
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    if-eqz p1, :cond_3

    .line 74
    .line 75
    iget-object p1, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->A:Ll/iam;

    .line 76
    .line 77
    check-cast p1, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;

    .line 78
    .line 79
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->B()Z

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    if-eqz p1, :cond_3

    .line 84
    .line 85
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->z:Ll/ar2;

    .line 86
    .line 87
    check-cast p0, Ll/b090;

    .line 88
    .line 89
    invoke-virtual {p0}, Ll/b090;->A0()V

    .line 90
    .line 91
    .line 92
    :cond_3
    return-void
.end method
