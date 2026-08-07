.class public Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->i()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout$a;->a:Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout$a;->a:Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Ljava/lang/Integer;

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-virtual {p0, p1, v0}, Landroid/view/View;->scrollTo(II)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
