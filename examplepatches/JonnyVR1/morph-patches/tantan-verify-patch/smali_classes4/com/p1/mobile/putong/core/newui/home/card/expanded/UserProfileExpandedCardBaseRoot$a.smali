.class public Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->K0(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot$a;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;

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
    .param p1    # Landroid/animation/ValueAnimator;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot$a;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;

    .line 12
    .line 13
    iput p1, v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->u:F

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->S0()V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot$a;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 21
    .line 22
    .line 23
    return-void
.end method
