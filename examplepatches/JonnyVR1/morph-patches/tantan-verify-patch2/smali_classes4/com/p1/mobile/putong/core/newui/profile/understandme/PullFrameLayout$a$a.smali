.class public Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout$a$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout$a;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout$a;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout$a$a;->a:Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout$a;

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
    .locals 0

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout$a$a;->a:Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout$a;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout$a;->a:Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout;

    .line 14
    .line 15
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout;->a(Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout;)Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationY(F)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
