.class public Ll/lny$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/lny;->b(Lcom/p1/mobile/putong/core/newui/view/RadarRipple;Lv/VDraweeView;)Landroid/animation/Animator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/view/RadarRipple;

.field public final synthetic b:Lv/VDraweeView;

.field public final synthetic c:Landroid/view/animation/ScaleAnimation;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/view/RadarRipple;Lv/VDraweeView;Landroid/view/animation/ScaleAnimation;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/lny$a;->a:Lcom/p1/mobile/putong/core/newui/view/RadarRipple;

    .line 2
    .line 3
    iput-object p2, p0, Ll/lny$a;->b:Lv/VDraweeView;

    .line 4
    .line 5
    iput-object p3, p0, Ll/lny$a;->c:Landroid/view/animation/ScaleAnimation;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/lny$a;->a:Lcom/p1/mobile/putong/core/newui/view/RadarRipple;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/view/RadarRipple;->f()V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/lny$a;->b:Lv/VDraweeView;

    .line 7
    .line 8
    iget-object p0, p0, Ll/lny$a;->c:Landroid/view/animation/ScaleAnimation;

    .line 9
    .line 10
    invoke-virtual {p1, p0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public onAnimationRepeat(Landroid/view/animation/Animation;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onAnimationStart(Landroid/view/animation/Animation;)V
    .locals 0

    .line 1
    return-void
.end method
