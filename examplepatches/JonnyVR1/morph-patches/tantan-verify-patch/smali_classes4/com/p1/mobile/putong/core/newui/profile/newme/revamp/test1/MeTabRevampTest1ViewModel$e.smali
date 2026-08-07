.class public final Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$e;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->Z(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0017\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0017\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0005\u0010\u0006\u00a8\u0006\u0007"
    }
    d2 = {
        "com/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$e",
        "Landroid/animation/AnimatorListenerAdapter;",
        "Landroid/animation/Animator;",
        "animation",
        "",
        "onAnimationEnd",
        "(Landroid/animation/Animator;)V",
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
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;

.field public final synthetic b:I

.field public final synthetic c:Lv/VLinear;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;ILv/VLinear;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$e;->a:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;

    .line 2
    .line 3
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$e;->b:I

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$e;->c:Lv/VLinear;

    .line 6
    .line 7
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$e;->a:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;

    .line 5
    .line 6
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$e;->b:I

    .line 7
    .line 8
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->N(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;I)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$e;->c:Lv/VLinear;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const/high16 p1, 0x3f800000    # 1.0f

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const-wide/16 v0, 0x96

    .line 24
    .line 25
    invoke-virtual {p0, v0, v1}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const/4 p1, 0x0

    .line 30
    invoke-virtual {p0, p1}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 35
    .line 36
    .line 37
    return-void
.end method
