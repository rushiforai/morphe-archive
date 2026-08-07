.class public final Ll/kdp;
.super Ll/y8s;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/y8s<",
        "Ll/oo2;",
        "Ll/edp;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0018\u00002\u0012\u0012\u0006\u0012\u0004\u0018\u00010\u0002\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0001B\u0019\u0012\u0010\u0010\u0005\u001a\u000c\u0012\u0006\u0008\u0001\u0012\u00020\u0002\u0018\u00010\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u000f\u0010\t\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u0008\t\u0010\nJ\r\u0010\u000b\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\u000b\u0010\nJ\r\u0010\u000c\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\u000c\u0010\nJ\u000f\u0010\r\u001a\u00020\u0008H\u0002\u00a2\u0006\u0004\u0008\r\u0010\nR\u001b\u0010\u0013\u001a\u00020\u000e8BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u000f\u0010\u0010\u001a\u0004\u0008\u0011\u0010\u0012R\u001b\u0010\u0018\u001a\u00020\u00148BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u0015\u0010\u0010\u001a\u0004\u0008\u0016\u0010\u0017\u00a8\u0006\u0019"
    }
    d2 = {
        "Ll/kdp;",
        "Ll/y8s;",
        "Ll/oo2;",
        "Ll/edp;",
        "Ll/dum;",
        "info",
        "<init>",
        "(Ll/dum;)V",
        "",
        "t",
        "()V",
        "a4",
        "Z3",
        "b4",
        "Ll/urn;",
        "j",
        "Lkotlin/Lazy;",
        "Y3",
        "()Ll/urn;",
        "intlInviteFriendToSharePresenter",
        "Ll/uen;",
        "k",
        "X3",
        "()Ll/uen;",
        "intlFamilyChatSharePresenter",
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
.field public final j:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final k:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 2
    .param p1    # Ll/dum;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+",
            "Ll/oo2;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/y8s;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lkotlin/LazyThreadSafetyMode;->NONE:Lkotlin/LazyThreadSafetyMode;

    .line 5
    .line 6
    new-instance v1, Ll/gdp;

    .line 7
    .line 8
    invoke-direct {v1, p1, p0}, Ll/gdp;-><init>(Ll/dum;Ll/kdp;)V

    .line 9
    .line 10
    .line 11
    invoke-static {v0, v1}, Lkotlin/LazyKt__LazyJVMKt;->a(Lkotlin/LazyThreadSafetyMode;Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iput-object v1, p0, Ll/kdp;->j:Lkotlin/Lazy;

    .line 16
    .line 17
    new-instance v1, Ll/hdp;

    .line 18
    .line 19
    invoke-direct {v1, p1, p0}, Ll/hdp;-><init>(Ll/dum;Ll/kdp;)V

    .line 20
    .line 21
    .line 22
    invoke-static {v0, v1}, Lkotlin/LazyKt__LazyJVMKt;->a(Lkotlin/LazyThreadSafetyMode;Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iput-object p1, p0, Ll/kdp;->k:Lkotlin/Lazy;

    .line 27
    .line 28
    return-void
.end method

.method public static S3(Ll/dum;Ll/kdp;)Ll/uen;
    .locals 1

    .line 1
    new-instance v0, Ll/uen;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/uen;-><init>(Ll/dum;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 7
    .line 8
    .line 9
    return-object v0
.end method

.method public static T3(Ll/kdp;Ljava/lang/Boolean;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/edp;

    .line 6
    .line 7
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 8
    .line 9
    iget-object v1, v1, Ll/dum;->a:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    invoke-direct {v0, v1, p0}, Ll/edp;-><init>(Lcom/p1/mobile/android/app/Act;Ll/kdp;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Ll/l6t;->C(Ll/iam;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 23
    .line 24
    check-cast p0, Ll/edp;

    .line 25
    .line 26
    if-eqz p0, :cond_1

    .line 27
    .line 28
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    invoke-virtual {p0, p1}, Ll/edp;->M(Z)V

    .line 36
    .line 37
    .line 38
    :cond_1
    return-void
.end method

.method public static U3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/yvr;->c(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static V3(Ll/kdp;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/kdp;->b4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static W3(Ll/dum;Ll/kdp;)Ll/urn;
    .locals 1

    .line 1
    new-instance v0, Ll/urn;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/urn;-><init>(Ll/dum;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 7
    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public final X3()Ll/uen;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kdp;->k:Lkotlin/Lazy;

    .line 2
    .line 3
    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/uen;

    .line 8
    .line 9
    return-object p0
.end method

.method public final Y3()Ll/urn;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kdp;->j:Lkotlin/Lazy;

    .line 2
    .line 3
    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/urn;

    .line 8
    .line 9
    return-object p0
.end method

.method public final Z3()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0}, Ll/kdp;->X3()Ll/uen;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Ll/uen;->W3()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final a4()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0}, Ll/kdp;->Y3()Ll/urn;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Ll/urn;->Z3()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final b4()V
    .locals 2

    .line 1
    invoke-static {}, Ll/kbo;->g()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/idp;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/idp;-><init>(Ll/kdp;)V

    .line 12
    .line 13
    .line 14
    new-instance p0, Ll/jdp;

    .line 15
    .line 16
    invoke-direct {p0}, Ll/jdp;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->IntlVoiceLiveEvent:Lcom/tantan/live/eventbus/LiveEventBus$IntlVoiceLiveEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$IntlVoiceLiveEvent;->openSharePanelDialog()Ll/v3f$c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lrx/c;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/fdp;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/fdp;-><init>(Ll/kdp;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    return-void
.end method
