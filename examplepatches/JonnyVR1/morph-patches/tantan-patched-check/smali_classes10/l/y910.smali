.class public final Ll/y910;
.super Ll/j7t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/j7t<",
        "Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/presenter/MultiCallApplyDlgPresenter;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000<\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\r\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u000f\u0010\u0008\u001a\u00020\u0007H\u0016\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u000f\u0010\u000b\u001a\u00020\nH\u0016\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u0015\u0010\u000f\u001a\u00020\u00072\u0006\u0010\u000e\u001a\u00020\r\u00a2\u0006\u0004\u0008\u000f\u0010\u0010J\u0017\u0010\u0013\u001a\u00020\u00072\u0006\u0010\u0012\u001a\u00020\u0011H\u0016\u00a2\u0006\u0004\u0008\u0013\u0010\u0014J\u0017\u0010\u0017\u001a\u00020\u00072\u0008\u0010\u0016\u001a\u0004\u0018\u00010\u0015\u00a2\u0006\u0004\u0008\u0017\u0010\u0018R\u0017\u0010\u0004\u001a\u00020\u00038\u0006\u00a2\u0006\u000c\n\u0004\u0008\u000b\u0010\u0019\u001a\u0004\u0008\u001a\u0010\u001bR#\u0010!\u001a\n \u001c*\u0004\u0018\u00010\u00110\u00118BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u001d\u0010\u001e\u001a\u0004\u0008\u001f\u0010 \u00a8\u0006\""
    }
    d2 = {
        "Ll/y910;",
        "Ll/j7t;",
        "Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/presenter/MultiCallApplyDlgPresenter;",
        "Landroid/content/Context;",
        "context",
        "<init>",
        "(Landroid/content/Context;)V",
        "",
        "init",
        "()V",
        "",
        "k",
        "()I",
        "",
        "vis",
        "C",
        "(Z)V",
        "",
        "userPic",
        "A",
        "(Ljava/lang/String;)V",
        "Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;",
        "call",
        "B",
        "(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V",
        "Landroid/content/Context;",
        "getContext",
        "()Landroid/content/Context;",
        "kotlin.jvm.PlatformType",
        "l",
        "Lkotlin/Lazy;",
        "z",
        "()Ljava/lang/String;",
        "joinText",
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

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# instance fields
.field public final k:Landroid/content/Context;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final l:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/j7t;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Ll/y910;->k:Landroid/content/Context;

    .line 8
    .line 9
    sget-object p1, Lkotlin/LazyThreadSafetyMode;->NONE:Lkotlin/LazyThreadSafetyMode;

    .line 10
    .line 11
    new-instance v0, Ll/u910;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/u910;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-static {p1, v0}, Lkotlin/LazyKt__LazyJVMKt;->a(Lkotlin/LazyThreadSafetyMode;Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iput-object p1, p0, Ll/y910;->l:Lkotlin/Lazy;

    .line 21
    .line 22
    return-void
.end method

.method public static v(Ll/y910;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->b:Ll/hj2;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/presenter/MultiCallApplyDlgPresenter;

    .line 4
    .line 5
    sget-object p1, Ll/cd10;->i:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/presenter/MultiCallApplyDlgPresenter;->Z3(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static w(Ll/y910;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/y910;->z()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object v0, p0, Ll/j7t;->j:Lv/VText;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->b:Ll/hj2;

    .line 16
    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/presenter/MultiCallApplyDlgPresenter;

    .line 20
    .line 21
    sget-object p1, Ll/cd10;->i:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/presenter/MultiCallApplyDlgPresenter;->Z3(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/presenter/MultiCallApplyDlgPresenter;

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/presenter/MultiCallApplyDlgPresenter;->d4()V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public static x(Ll/y910;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->b:Ll/hj2;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/presenter/MultiCallApplyDlgPresenter;

    .line 4
    .line 5
    sget-object p1, Ll/cd10;->j:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/presenter/MultiCallApplyDlgPresenter;->Z3(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static y()Ljava/lang/String;
    .locals 1

    .line 1
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->k8:I

    .line 2
    .line 3
    invoke-static {v0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    return-object v0
.end method


# virtual methods
.method public A(Ljava/lang/String;)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/j7t;->f:Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallConnectionIconView;

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallConnectionIconView;->i0(Ljava/lang/String;Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final B(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V
    .locals 3
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-static {p1}, Ll/fp10;->b(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object v0, p0, Ll/j7t;->g:Lv/VText;

    .line 6
    .line 7
    const/4 v1, -0x1

    .line 8
    const/4 v2, 0x1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->M7:I

    .line 12
    .line 13
    invoke-static {p1}, Ll/xau;->t(I)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v2}, Ll/y910;->C(Z)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Ll/j7t;->j:Lv/VText;

    .line 24
    .line 25
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->j9:I

    .line 26
    .line 27
    invoke-static {p1}, Ll/xau;->t(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 35
    .line 36
    .line 37
    sget p1, Ll/obc0;->c1:I

    .line 38
    .line 39
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_0
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->N7:I

    .line 44
    .line 45
    invoke-static {p1}, Ll/xau;->t(I)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 50
    .line 51
    .line 52
    invoke-static {}, Ll/bf10;->O()Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    xor-int/2addr p1, v2

    .line 57
    invoke-virtual {p0, p1}, Ll/y910;->C(Z)V

    .line 58
    .line 59
    .line 60
    iget-object p0, p0, Ll/j7t;->j:Lv/VText;

    .line 61
    .line 62
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->k8:I

    .line 63
    .line 64
    invoke-static {p1}, Ll/xau;->t(I)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 72
    .line 73
    .line 74
    sget p1, Ll/obc0;->C0:I

    .line 75
    .line 76
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public final C(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/j7t;->j:Lv/VText;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/j7t;->h:Lv/VText;

    .line 7
    .line 8
    xor-int/lit8 v1, p1, 0x1

    .line 9
    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/j7t;->i:Lv/VText;

    .line 14
    .line 15
    xor-int/lit8 p1, p1, 0x1

    .line 16
    .line 17
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public init()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->init()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/j7t;->j:Lv/VText;

    .line 5
    .line 6
    new-instance v1, Ll/v910;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Ll/v910;-><init>(Ll/y910;)V

    .line 9
    .line 10
    .line 11
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/j7t;->i:Lv/VText;

    .line 15
    .line 16
    new-instance v1, Ll/w910;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ll/w910;-><init>(Ll/y910;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/j7t;->h:Lv/VText;

    .line 25
    .line 26
    new-instance v1, Ll/x910;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/x910;-><init>(Ll/y910;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 32
    .line 33
    .line 34
    invoke-static {}, Ll/bf10;->O()Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_0

    .line 39
    .line 40
    const/4 v0, 0x0

    .line 41
    invoke-virtual {p0, v0}, Ll/y910;->C(Z)V

    .line 42
    .line 43
    .line 44
    :cond_0
    return-void
.end method

.method public k()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public final z()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y910;->l:Lkotlin/Lazy;

    .line 2
    .line 3
    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/String;

    .line 8
    .line 9
    return-object p0
.end method
