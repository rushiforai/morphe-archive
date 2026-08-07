.class public final Ll/dl0;
.super Ll/i7t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i7t<",
        "Ll/ll0<",
        "*>;",
        "Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u000e\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0010\u000e\n\u0002\u0008\u0005\u0018\u00002\u0012\u0012\u0008\u0012\u0006\u0012\u0002\u0008\u00030\u0002\u0012\u0004\u0012\u00020\u00030\u0001B\u0007\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u001f\u0010\u000b\u001a\u00020\n2\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\u0008H\u0002\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u0017\u0010\u000e\u001a\u00020\n2\u0006\u0010\r\u001a\u00020\u0003H\u0016\u00a2\u0006\u0004\u0008\u000e\u0010\u000fJ\u000f\u0010\u0010\u001a\u00020\nH\u0016\u00a2\u0006\u0004\u0008\u0010\u0010\u0005J\u000f\u0010\u0011\u001a\u00020\nH\u0016\u00a2\u0006\u0004\u0008\u0011\u0010\u0005J\u0015\u0010\u0012\u001a\u00020\n2\u0006\u0010\r\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0012\u0010\u000fJ\u0015\u0010\u0014\u001a\u00020\n2\u0006\u0010\u0013\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\u0014\u0010\u0015J\u0017\u0010\u0016\u001a\u00020\u00062\u0006\u0010\r\u001a\u00020\u0003H\u0002\u00a2\u0006\u0004\u0008\u0016\u0010\u0017J\u0017\u0010\u0018\u001a\u00020\n2\u0006\u0010\r\u001a\u00020\u0003H\u0002\u00a2\u0006\u0004\u0008\u0018\u0010\u000fR#\u0010\u001f\u001a\n \u001a*\u0004\u0018\u00010\u00190\u00198BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u001b\u0010\u001c\u001a\u0004\u0008\u001d\u0010\u001eR#\u0010$\u001a\n \u001a*\u0004\u0018\u00010 0 8BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008!\u0010\u001c\u001a\u0004\u0008\"\u0010#\u00a8\u0006%"
    }
    d2 = {
        "Ll/dl0;",
        "Ll/i7t;",
        "Ll/ll0;",
        "Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;",
        "<init>",
        "()V",
        "",
        "show",
        "",
        "i",
        "",
        "K",
        "(ZI)V",
        "announcement",
        "L",
        "(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;)V",
        "init",
        "j",
        "M",
        "enable",
        "F",
        "(Z)V",
        "J",
        "(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;)Z",
        "N",
        "Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;",
        "kotlin.jvm.PlatformType",
        "l",
        "Lkotlin/Lazy;",
        "H",
        "()Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;",
        "roomAnnouncement",
        "",
        "m",
        "G",
        "()Ljava/lang/String;",
        "publishStr",
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


# instance fields
.field public final l:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final m:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/i7t;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lkotlin/LazyThreadSafetyMode;->NONE:Lkotlin/LazyThreadSafetyMode;

    .line 5
    .line 6
    new-instance v1, Ll/al0;

    .line 7
    .line 8
    invoke-direct {v1}, Ll/al0;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-static {v0, v1}, Lkotlin/LazyKt__LazyJVMKt;->a(Lkotlin/LazyThreadSafetyMode;Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iput-object v1, p0, Ll/dl0;->l:Lkotlin/Lazy;

    .line 16
    .line 17
    new-instance v1, Ll/bl0;

    .line 18
    .line 19
    invoke-direct {v1}, Ll/bl0;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-static {v0, v1}, Lkotlin/LazyKt__LazyJVMKt;->a(Lkotlin/LazyThreadSafetyMode;Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iput-object v0, p0, Ll/dl0;->m:Lkotlin/Lazy;

    .line 27
    .line 28
    return-void
.end method

.method public static A(Ll/dl0;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i7t;->h:Landroid/widget/EditText;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static B(Ll/dl0;Landroid/view/View;)Lkotlin/Unit;
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/dl0;->G()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iget-object v0, p0, Ll/i7t;->j:Landroid/widget/TextView;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->b:Ll/hj2;

    .line 21
    .line 22
    check-cast p1, Ll/ll0;

    .line 23
    .line 24
    iget-object p0, p0, Ll/i7t;->h:Landroid/widget/EditText;

    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p1, p0}, Ll/ll0;->Z3(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->lc:I

    .line 39
    .line 40
    invoke-static {p0}, Ll/r1j0;->f(I)V

    .line 41
    .line 42
    .line 43
    :goto_0
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 44
    .line 45
    return-object p0
.end method

.method public static C(Ll/dl0;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->l()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 9
    .line 10
    .line 11
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->act()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 18
    .line 19
    .line 20
    :cond_1
    return-void
.end method

.method public static final synthetic E(Ll/dl0;)Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/dl0;->H()Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static final I(Ll/dl0;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->b:Ll/hj2;

    .line 2
    .line 3
    check-cast p0, Ll/ll0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ll0;->W3()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private final K(ZI)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->l()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_1

    .line 8
    .line 9
    int-to-float p1, p2

    .line 10
    neg-float p1, p1

    .line 11
    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationY(F)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->l()Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    const/4 p1, 0x0

    .line 22
    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationY(F)V

    .line 23
    .line 24
    .line 25
    :cond_1
    return-void
.end method

.method public static v()Ljava/lang/String;
    .locals 1

    .line 1
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->jc:I

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

.method public static w()Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;
    .locals 1

    .line 1
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/vwt;->k5()Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    return-object v0
.end method

.method public static x(Ll/dl0;Ljava/lang/Boolean;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    invoke-direct {p0, p1, p2}, Ll/dl0;->K(ZI)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static synthetic y(Ll/dl0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/dl0;->I(Ll/dl0;Landroid/view/View;)V

    return-void
.end method

.method public static z(Ll/dl0;Landroid/view/View;)Lkotlin/Unit;
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/jr10;->m()V

    .line 5
    .line 6
    .line 7
    new-instance p1, Ll/th0$a;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->C0()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-direct {p1, v0}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 14
    .line 15
    .line 16
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->mc:I

    .line 17
    .line 18
    invoke-static {v0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p1, v0}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->a:I

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Ll/th0$a;->e(I)Ll/th0$a;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->b:I

    .line 33
    .line 34
    invoke-virtual {p1, v0}, Ll/th0$a;->q(I)Ll/th0$a;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    const/4 v0, 0x0

    .line 39
    invoke-virtual {p1, v0}, Ll/th0$a;->h(Z)Ll/th0$a;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    new-instance v0, Ll/cl0;

    .line 44
    .line 45
    invoke-direct {v0, p0}, Ll/cl0;-><init>(Ll/dl0;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1, v0}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 57
    .line 58
    .line 59
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 60
    .line 61
    return-object p0
.end method


# virtual methods
.method public final F(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i7t;->j:Landroid/widget/TextView;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    sget p1, Ll/obc0;->q0:I

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    sget p1, Ll/obc0;->V:I

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final G()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dl0;->m:Lkotlin/Lazy;

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

.method public final H()Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dl0;->l:Lkotlin/Lazy;

    .line 2
    .line 3
    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 8
    .line 9
    return-object p0
.end method

.method public final J(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;)Z
    .locals 1

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;->state:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncementState;

    .line 2
    .line 3
    const-string v0, "default"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_1

    .line 10
    .line 11
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;->state:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncementState;

    .line 12
    .line 13
    const-string p1, "pending"

    .line 14
    .line 15
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0

    .line 24
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 25
    return p0
.end method

.method public L(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;)V
    .locals 3
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->q(Ljava/lang/Object;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/i7t;->k:Landroid/widget/TextView;

    .line 8
    .line 9
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;->state:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncementState;

    .line 10
    .line 11
    const-string v2, "approved"

    .line 12
    .line 13
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, p1}, Ll/dl0;->M(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, p1}, Ll/dl0;->N(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final M(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;)V
    .locals 3
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;->state:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncementState;

    .line 5
    .line 6
    const-string v1, "default"

    .line 7
    .line 8
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iget-object v1, p0, Ll/i7t;->h:Landroid/widget/EditText;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->ic:I

    .line 17
    .line 18
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setHint(I)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/i7t;->h:Landroid/widget/EditText;

    .line 22
    .line 23
    const-string v1, ""

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;->content:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 32
    .line 33
    .line 34
    :goto_0
    iget-object v0, p0, Ll/i7t;->i:Landroid/widget/TextView;

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/dl0;->H()Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    iget v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->maxLength:I

    .line 41
    .line 42
    iget-object v2, p0, Ll/i7t;->h:Landroid/widget/EditText;

    .line 43
    .line 44
    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-interface {v2}, Ljava/lang/CharSequence;->length()I

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    sub-int/2addr v1, v2

    .line 53
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 58
    .line 59
    .line 60
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;->state:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncementState;

    .line 61
    .line 62
    const-string v0, "pending"

    .line 63
    .line 64
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    iget-object v0, p0, Ll/i7t;->h:Landroid/widget/EditText;

    .line 69
    .line 70
    if-eqz p1, :cond_1

    .line 71
    .line 72
    const/4 p1, 0x0

    .line 73
    invoke-virtual {v0, p1}, Landroid/view/View;->setFocusable(Z)V

    .line 74
    .line 75
    .line 76
    iget-object p0, p0, Ll/i7t;->h:Landroid/widget/EditText;

    .line 77
    .line 78
    invoke-virtual {p0, p1}, Landroid/view/View;->setFocusableInTouchMode(Z)V

    .line 79
    .line 80
    .line 81
    return-void

    .line 82
    :cond_1
    const/4 p1, 0x1

    .line 83
    invoke-virtual {v0, p1}, Landroid/view/View;->setFocusableInTouchMode(Z)V

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Ll/i7t;->h:Landroid/widget/EditText;

    .line 87
    .line 88
    invoke-virtual {v0, p1}, Landroid/view/View;->setFocusable(Z)V

    .line 89
    .line 90
    .line 91
    iget-object p1, p0, Ll/i7t;->h:Landroid/widget/EditText;

    .line 92
    .line 93
    invoke-virtual {p1}, Landroid/view/View;->requestFocus()Z

    .line 94
    .line 95
    .line 96
    iget-object p0, p0, Ll/i7t;->h:Landroid/widget/EditText;

    .line 97
    .line 98
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 103
    .line 104
    .line 105
    move-result p1

    .line 106
    invoke-virtual {p0, p1}, Landroid/widget/EditText;->setSelection(I)V

    .line 107
    .line 108
    .line 109
    return-void
.end method

.method public final N(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;->state:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncementState;

    .line 2
    .line 3
    const-string v1, "pending"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/i7t;->j:Landroid/widget/TextView;

    .line 12
    .line 13
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->fc:I

    .line 14
    .line 15
    invoke-static {v1}, Ll/xau;->t(I)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    sget-object v0, Ll/jr10;->INSTANCE:Ll/jr10;

    .line 24
    .line 25
    invoke-virtual {v0}, Ll/jr10;->r()V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/i7t;->j:Landroid/widget/TextView;

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/dl0;->G()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 35
    .line 36
    .line 37
    :goto_0
    invoke-virtual {p0, p1}, Ll/dl0;->J(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;)Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    xor-int/lit8 p1, p1, 0x1

    .line 42
    .line 43
    invoke-virtual {p0, p1}, Ll/dl0;->F(Z)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public init()V
    .locals 4

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->init()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->act()Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    new-instance v1, Landroid/view/View;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->act()Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-direct {v1, v2}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 17
    .line 18
    .line 19
    iget-object v2, p0, Ll/i7t;->h:Landroid/widget/EditText;

    .line 20
    .line 21
    new-instance v3, Ll/vk0;

    .line 22
    .line 23
    invoke-direct {v3, p0}, Ll/vk0;-><init>(Ll/dl0;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1, v2, v3}, Lcom/p1/mobile/android/app/Act;->setUpKeyboardDetectorLayout(Landroid/view/View;Landroid/view/View;Ll/z20;)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    :cond_0
    iget-object v0, p0, Ll/i7t;->h:Landroid/widget/EditText;

    .line 30
    .line 31
    new-instance v1, Ll/wk0;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/wk0;-><init>(Ll/dl0;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ll/i7t;->h:Landroid/widget/EditText;

    .line 40
    .line 41
    new-instance v1, Ll/dl0$a;

    .line 42
    .line 43
    invoke-direct {v1, p0}, Ll/dl0$a;-><init>(Ll/dl0;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Ll/i7t;->i:Landroid/widget/TextView;

    .line 50
    .line 51
    invoke-virtual {p0}, Ll/dl0;->H()Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    iget v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->maxLength:I

    .line 56
    .line 57
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Ll/i7t;->j:Landroid/widget/TextView;

    .line 65
    .line 66
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 67
    .line 68
    .line 69
    new-instance v1, Ll/xk0;

    .line 70
    .line 71
    invoke-direct {v1, p0}, Ll/xk0;-><init>(Ll/dl0;)V

    .line 72
    .line 73
    .line 74
    invoke-static {v0, v1}, Ll/czq;->c(Landroid/view/View;Lkotlin/jvm/functions/Function1;)V

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Ll/i7t;->k:Landroid/widget/TextView;

    .line 78
    .line 79
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 80
    .line 81
    .line 82
    new-instance v1, Ll/yk0;

    .line 83
    .line 84
    invoke-direct {v1, p0}, Ll/yk0;-><init>(Ll/dl0;)V

    .line 85
    .line 86
    .line 87
    invoke-static {v0, v1}, Ll/czq;->c(Landroid/view/View;Lkotlin/jvm/functions/Function1;)V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public j()V
    .locals 4

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->j()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->act()Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    new-instance v1, Ll/zk0;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Ll/zk0;-><init>(Ll/dl0;)V

    .line 11
    .line 12
    .line 13
    const-wide/16 v2, 0x12c

    .line 14
    .line 15
    invoke-static {v0, v1, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
