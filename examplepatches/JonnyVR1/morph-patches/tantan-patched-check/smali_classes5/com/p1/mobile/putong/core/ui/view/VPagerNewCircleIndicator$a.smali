.class public Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator$a;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->onPageSelected(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator$a;->a:Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator$a;->a:Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->c(Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;)Landroid/widget/LinearLayout;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator$a;->a:Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;

    .line 12
    .line 13
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->b(Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;)I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    add-int/lit8 p1, p1, 0x1

    .line 18
    .line 19
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;->e(Lcom/p1/mobile/putong/core/ui/view/VPagerNewCircleIndicator;I)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
