.class public final Ll/yy5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ya5;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\t\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0015\u0010\t\u001a\u00020\u00082\u0006\u0010\u0007\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\t\u0010\nJ\u000f\u0010\u000b\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u001f\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u0003\u001a\u00020\u00022\u0006\u0010\u000e\u001a\u00020\rH\u0002\u00a2\u0006\u0004\u0008\u0010\u0010\u0011R\u0017\u0010\u0003\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0012\u0010\u0013\u001a\u0004\u0008\u0014\u0010\u0015R\u0016\u0010\u0018\u001a\u00020\u000f8\u0002@\u0002X\u0082.\u00a2\u0006\u0006\n\u0004\u0008\u0016\u0010\u0017R\u001b\u0010\u001d\u001a\u00020\u00198BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u0010\u0010\u001a\u001a\u0004\u0008\u001b\u0010\u001c\u00a8\u0006\u001e"
    }
    d2 = {
        "Ll/yy5;",
        "Ll/ya5;",
        "Lcom/p1/mobile/android/app/Act;",
        "act",
        "<init>",
        "(Lcom/p1/mobile/android/app/Act;)V",
        "Lcom/p1/mobile/putong/data/User;",
        "user",
        "",
        "e",
        "(Lcom/p1/mobile/putong/data/User;)V",
        "close",
        "()V",
        "Landroid/view/View;",
        "rootView",
        "Lcom/p1/mobile/android/app/Dialog;",
        "c",
        "(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)Lcom/p1/mobile/android/app/Dialog;",
        "a",
        "Lcom/p1/mobile/android/app/Act;",
        "getAct",
        "()Lcom/p1/mobile/android/app/Act;",
        "b",
        "Lcom/p1/mobile/android/app/Dialog;",
        "dialog",
        "Ll/l4g0;",
        "Lkotlin/Lazy;",
        "d",
        "()Ll/l4g0;",
        "pageHelp",
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


# instance fields
.field public final a:Lcom/p1/mobile/android/app/Act;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public b:Lcom/p1/mobile/android/app/Dialog;

.field public final c:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Ll/yy5;->a:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    new-instance p1, Ll/wy5;

    .line 10
    .line 11
    invoke-direct {p1}, Ll/wy5;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-static {p1}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iput-object p1, p0, Ll/yy5;->c:Lkotlin/Lazy;

    .line 19
    .line 20
    return-void
.end method

.method public static a()Ll/l4g0;
    .locals 2

    .line 1
    new-instance v0, Ll/l4g0;

    .line 2
    .line 3
    new-instance v1, Ll/yy5$a;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/yy5$a;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Ll/l4g0;-><init>(Ll/e6m;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method public static b(Ll/yy5;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/yy5;->d()Ll/l4g0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private final d()Ll/l4g0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yy5;->c:Lkotlin/Lazy;

    .line 2
    .line 3
    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/l4g0;

    .line 8
    .line 9
    return-object p0
.end method


# virtual methods
.method public final c(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)Lcom/p1/mobile/android/app/Dialog;
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget p1, Ll/agc0;->o:I

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->L(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/4 p1, 0x0

    .line 12
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/android/app/Dialog$e;->P(Landroid/view/View;Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const/4 p1, 0x1

    .line 17
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 26
    .line 27
    .line 28
    return-object p0
.end method

.method public close()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yy5;->b:Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, "dialog"

    .line 6
    .line 7
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    :cond_0
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final e(Lcom/p1/mobile/putong/data/User;)V
    .locals 3
    .param p1    # Lcom/p1/mobile/putong/data/User;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/yy5;->a:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sget v1, Ll/kec0;->x4:I

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v1, p0, Ll/yy5;->a:Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v1, v0}, Ll/yy5;->c(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)Lcom/p1/mobile/android/app/Dialog;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iput-object v1, p0, Ll/yy5;->b:Lcom/p1/mobile/android/app/Dialog;

    .line 27
    .line 28
    instance-of v1, v0, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;

    .line 29
    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    check-cast v0, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;

    .line 33
    .line 34
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->setListener(Ll/ya5;)V

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Ll/yy5;->a:Lcom/p1/mobile/android/app/Act;

    .line 38
    .line 39
    invoke-virtual {v0, v1, p1}, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->h0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V

    .line 40
    .line 41
    .line 42
    :cond_0
    iget-object p1, p0, Ll/yy5;->b:Lcom/p1/mobile/android/app/Dialog;

    .line 43
    .line 44
    const-string v0, "dialog"

    .line 45
    .line 46
    if-nez p1, :cond_1

    .line 47
    .line 48
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    move-object p1, v2

    .line 52
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 53
    .line 54
    .line 55
    iget-object p1, p0, Ll/yy5;->b:Lcom/p1/mobile/android/app/Dialog;

    .line 56
    .line 57
    if-nez p1, :cond_2

    .line 58
    .line 59
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_2
    move-object v2, p1

    .line 64
    :goto_0
    new-instance p1, Ll/xy5;

    .line 65
    .line 66
    invoke-direct {p1, p0}, Ll/xy5;-><init>(Ll/yy5;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v2, p1}, Ll/g1e;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 70
    .line 71
    .line 72
    invoke-direct {p0}, Ll/yy5;->d()Ll/l4g0;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-static {p0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 77
    .line 78
    .line 79
    return-void
.end method
