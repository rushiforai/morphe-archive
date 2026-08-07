.class public final Ll/bmi0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/xa5;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000,\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0008\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0015\u0010\t\u001a\u00020\u00082\u0006\u0010\u0007\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\t\u0010\nJ\u000f\u0010\u000b\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u001f\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u0003\u001a\u00020\u00022\u0006\u0010\u000e\u001a\u00020\rH\u0002\u00a2\u0006\u0004\u0008\u0010\u0010\u0011R\u0017\u0010\u0003\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0010\u0010\u0012\u001a\u0004\u0008\u0013\u0010\u0014R\u0016\u0010\u0016\u001a\u00020\u000f8\u0002@\u0002X\u0082.\u00a2\u0006\u0006\n\u0004\u0008\t\u0010\u0015\u00a8\u0006\u0017"
    }
    d2 = {
        "Ll/bmi0;",
        "Ll/xa5;",
        "Lcom/p1/mobile/android/app/Act;",
        "act",
        "<init>",
        "(Lcom/p1/mobile/android/app/Act;)V",
        "Lcom/p1/mobile/putong/core/data/TarotData;",
        "tarotInfo",
        "",
        "b",
        "(Lcom/p1/mobile/putong/core/data/TarotData;)V",
        "close",
        "()V",
        "Landroid/view/View;",
        "rootView",
        "Lcom/p1/mobile/android/app/Dialog;",
        "a",
        "(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)Lcom/p1/mobile/android/app/Dialog;",
        "Lcom/p1/mobile/android/app/Act;",
        "getAct",
        "()Lcom/p1/mobile/android/app/Act;",
        "Lcom/p1/mobile/android/app/Dialog;",
        "dialog",
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
    iput-object p1, p0, Ll/bmi0;->a:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final a(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)Lcom/p1/mobile/android/app/Dialog;
    .locals 1

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
    const/high16 p2, 0x41c00000    # 24.0f

    .line 17
    .line 18
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    invoke-virtual {p0, v0, p1, p2, p1}, Lcom/p1/mobile/android/app/Dialog$e;->C(IIII)Lcom/p1/mobile/android/app/Dialog$e;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const/4 p1, 0x1

    .line 31
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 40
    .line 41
    .line 42
    return-object p0
.end method

.method public final b(Lcom/p1/mobile/putong/core/data/TarotData;)V
    .locals 3
    .param p1    # Lcom/p1/mobile/putong/core/data/TarotData;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/bmi0;->a:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sget v1, Ll/kec0;->O5:I

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
    iget-object v1, p0, Ll/bmi0;->a:Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v1, v0}, Ll/bmi0;->a(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)Lcom/p1/mobile/android/app/Dialog;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iput-object v1, p0, Ll/bmi0;->b:Lcom/p1/mobile/android/app/Dialog;

    .line 27
    .line 28
    instance-of v1, v0, Lcom/p1/mobile/putong/core/ui/tarot/TarotInfoView;

    .line 29
    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    check-cast v0, Lcom/p1/mobile/putong/core/ui/tarot/TarotInfoView;

    .line 33
    .line 34
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/ui/tarot/TarotInfoView;->setListener(Ll/xa5;)V

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Ll/bmi0;->a:Lcom/p1/mobile/android/app/Act;

    .line 38
    .line 39
    invoke-virtual {v0, v1, p1}, Lcom/p1/mobile/putong/core/ui/tarot/TarotInfoView;->i0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/TarotData;)V

    .line 40
    .line 41
    .line 42
    :cond_0
    iget-object p0, p0, Ll/bmi0;->b:Lcom/p1/mobile/android/app/Dialog;

    .line 43
    .line 44
    if-nez p0, :cond_1

    .line 45
    .line 46
    const-string p0, "dialog"

    .line 47
    .line 48
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_1
    move-object v2, p0

    .line 53
    :goto_0
    invoke-virtual {v2}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public close()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bmi0;->b:Lcom/p1/mobile/android/app/Dialog;

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
