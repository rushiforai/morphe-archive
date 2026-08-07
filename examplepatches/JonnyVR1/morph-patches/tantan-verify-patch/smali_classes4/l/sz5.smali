.class public final synthetic Ll/sz5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Landroid/view/View;

.field public final synthetic b:Landroid/view/View;

.field public final synthetic c:Lcom/p1/mobile/putong/core/ui/constellationmatch/a;


# direct methods
.method public synthetic constructor <init>(Landroid/view/View;Landroid/view/View;Lcom/p1/mobile/putong/core/ui/constellationmatch/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sz5;->a:Landroid/view/View;

    iput-object p2, p0, Ll/sz5;->b:Landroid/view/View;

    iput-object p3, p0, Ll/sz5;->c:Lcom/p1/mobile/putong/core/ui/constellationmatch/a;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/sz5;->a:Landroid/view/View;

    iget-object v1, p0, Ll/sz5;->b:Landroid/view/View;

    iget-object p0, p0, Ll/sz5;->c:Lcom/p1/mobile/putong/core/ui/constellationmatch/a;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/constellationmatch/a;->j(Landroid/view/View;Landroid/view/View;Lcom/p1/mobile/putong/core/ui/constellationmatch/a;Landroid/animation/ValueAnimator;)V

    return-void
.end method
