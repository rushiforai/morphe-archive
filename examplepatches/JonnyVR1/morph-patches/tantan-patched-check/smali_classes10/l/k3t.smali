.class public final Ll/k3t;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0008\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J#\u0010\t\u001a\u00020\u00082\u0006\u0010\u0005\u001a\u00020\u00042\n\u0008\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0006H\u0007\u00a2\u0006\u0004\u0008\t\u0010\nJ!\u0010\u000b\u001a\u00020\u00082\u0006\u0010\u0005\u001a\u00020\u00042\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u0006H\u0002\u00a2\u0006\u0004\u0008\u000b\u0010\nJ!\u0010\u000c\u001a\u00020\u00082\u0006\u0010\u0005\u001a\u00020\u00042\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u0006H\u0002\u00a2\u0006\u0004\u0008\u000c\u0010\nJ\u0017\u0010\r\u001a\u00020\u00082\u0006\u0010\u0005\u001a\u00020\u0004H\u0002\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\u0017\u0010\u000f\u001a\u00020\u00082\u0006\u0010\u0005\u001a\u00020\u0004H\u0002\u00a2\u0006\u0004\u0008\u000f\u0010\u000e\u00a8\u0006\u0010"
    }
    d2 = {
        "Ll/k3t;",
        "",
        "<init>",
        "()V",
        "Lcom/p1/mobile/android/app/Act;",
        "act",
        "Ljava/lang/Runnable;",
        "dismissAction",
        "",
        "g",
        "(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)V",
        "j",
        "e",
        "f",
        "(Lcom/p1/mobile/android/app/Act;)V",
        "i",
        "livingroom_intlGmsRelease"
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
.field public static final INSTANCE:Ll/k3t;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/k3t;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/k3t;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/k3t;->INSTANCE:Ll/k3t;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    sget-object v0, Ll/k3t;->INSTANCE:Ll/k3t;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ll/k3t;->f(Lcom/p1/mobile/android/app/Act;)V

    .line 4
    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public static b(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;Z)V
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    sget-object p2, Ll/k3t;->INSTANCE:Ll/k3t;

    .line 4
    .line 5
    invoke-virtual {p2, p0, p1}, Ll/k3t;->j(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    sget-object p2, Ll/k3t;->INSTANCE:Ll/k3t;

    .line 10
    .line 11
    invoke-virtual {p2, p0, p1}, Ll/k3t;->e(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static c(Ljava/lang/Runnable;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 4
    .line 5
    .line 6
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static d(Ljava/lang/Runnable;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 4
    .line 5
    .line 6
    :cond_0
    sget-object p0, Ll/k3t;->INSTANCE:Ll/k3t;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/k3t;->i(Lcom/p1/mobile/android/app/Act;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static final g(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)V
    .locals 2
    .param p0    # Lcom/p1/mobile/android/app/Act;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/Runnable;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/wrv;->E()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    sget-object v0, Ll/k3t;->INSTANCE:Ll/k3t;

    .line 13
    .line 14
    invoke-virtual {v0, p0, p1}, Ll/k3t;->j(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 19
    .line 20
    invoke-virtual {v0}, Ll/wrv;->X()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 27
    .line 28
    new-instance v1, Ll/g3t;

    .line 29
    .line 30
    invoke-direct {v1, p0, p1}, Ll/g3t;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ll/wrv;->h0(Ll/y20;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_1
    sget-object v0, Ll/k3t;->INSTANCE:Ll/k3t;

    .line 38
    .line 39
    invoke-virtual {v0, p0, p1}, Ll/k3t;->e(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public static synthetic h(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;ILjava/lang/Object;)V
    .locals 0

    .line 1
    and-int/lit8 p2, p2, 0x2

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    :cond_0
    invoke-static {p0, p1}, Ll/k3t;->g(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final e(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    new-instance p0, Ll/th0$a;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->T7:I

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/th0$a;->i(I)Ll/th0$a;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->q8:I

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Ll/th0$a;->e(I)Ll/th0$a;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    new-instance v0, Ll/h3t;

    .line 19
    .line 20
    invoke-direct {v0, p2, p1}, Ll/h3t;-><init>(Ljava/lang/Runnable;Lcom/p1/mobile/android/app/Act;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, v0}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const/4 v0, 0x0

    .line 28
    invoke-virtual {p0, v0}, Ll/th0$a;->g(Z)Ll/th0$a;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0, v0}, Ll/th0$a;->h(Z)Ll/th0$a;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->S7:I

    .line 37
    .line 38
    invoke-virtual {p0, v0}, Ll/th0$a;->q(I)Ll/th0$a;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    new-instance v0, Ll/i3t;

    .line 43
    .line 44
    invoke-direct {v0, p2, p1}, Ll/i3t;-><init>(Ljava/lang/Runnable;Lcom/p1/mobile/android/app/Act;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0, v0}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public final f(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;->getBuilder()Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;->m(Z)Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const/4 v0, 0x1

    .line 11
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;->l(Z)Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string v0, "moment-nearby-match"

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;->n(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;->k()Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-static {p1, p0}, Ll/pn0;->o(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final i(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    sget-object p0, Ll/efv;->a:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/vwt;->G5()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string p0, "?createAnchorInterfaceType="

    .line 20
    .line 21
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string p0, "&extra=multiMatch"

    .line 28
    .line 29
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    sget v0, Lcom/p1/mobile/putong/live/base/webview/LiveWebViewAct;->l:I

    .line 37
    .line 38
    invoke-static {p1, p0, v0}, Lcom/p1/mobile/putong/live/base/webview/LiveWebViewAct;->e2(Landroid/content/Context;Ljava/lang/String;I)Landroid/content/Intent;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public final j(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)V
    .locals 2

    .line 1
    sget-object p0, Ll/iit;->Companion:Ll/iit$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/iit$a;->O()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->gj:I

    .line 8
    .line 9
    new-instance v1, Ll/j3t;

    .line 10
    .line 11
    invoke-direct {v1, p1, p2}, Ll/j3t;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p1, p0, v0, v1}, Ll/wgt;->q(Lcom/p1/mobile/android/app/Act;IILl/x20;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
