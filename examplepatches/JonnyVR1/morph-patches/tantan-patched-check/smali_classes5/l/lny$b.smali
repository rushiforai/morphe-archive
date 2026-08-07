.class public Ll/lny$b;
.super Ll/gt0$j;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/lny;->b(Lcom/p1/mobile/putong/core/newui/view/RadarRipple;Lv/VDraweeView;)Landroid/animation/Animator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lv/VDraweeView;

.field public final synthetic b:Landroid/view/animation/ScaleAnimation;

.field public final synthetic c:Landroid/view/animation/ScaleAnimation;

.field public final synthetic d:Lcom/p1/mobile/putong/core/newui/view/RadarRipple;


# direct methods
.method public constructor <init>(Lv/VDraweeView;Landroid/view/animation/ScaleAnimation;Landroid/view/animation/ScaleAnimation;Lcom/p1/mobile/putong/core/newui/view/RadarRipple;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/lny$b;->a:Lv/VDraweeView;

    .line 2
    .line 3
    iput-object p2, p0, Ll/lny$b;->b:Landroid/view/animation/ScaleAnimation;

    .line 4
    .line 5
    iput-object p3, p0, Ll/lny$b;->c:Landroid/view/animation/ScaleAnimation;

    .line 6
    .line 7
    iput-object p4, p0, Ll/lny$b;->d:Lcom/p1/mobile/putong/core/newui/view/RadarRipple;

    .line 8
    .line 9
    invoke-direct {p0}, Ll/gt0$j;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/lny$b;->b:Landroid/view/animation/ScaleAnimation;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/animation/Animation;->cancel()V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/lny$b;->c:Landroid/view/animation/ScaleAnimation;

    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/view/animation/Animation;->cancel()V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/lny$b;->d:Lcom/p1/mobile/putong/core/newui/view/RadarRipple;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/view/RadarRipple;->c:Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/lny$b;->a:Lv/VDraweeView;

    .line 2
    .line 3
    iget-object p0, p0, Ll/lny$b;->b:Landroid/view/animation/ScaleAnimation;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/lny$b;->a:Lv/VDraweeView;

    .line 2
    .line 3
    iget-object p0, p0, Ll/lny$b;->b:Landroid/view/animation/ScaleAnimation;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
